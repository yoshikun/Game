package com.yo.framework.utils
{
	import com.yo.framework.core.FP;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.filters.BitmapFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class DisplayObjectUtil
	{
		public function DisplayObjectUtil()
		{
		}
		
		public static function getDisplayObjectRectangle(container:DisplayObjectContainer, processFilters:Boolean):Rectangle
		{
			var final_rectangle:Rectangle = processDisplayObjectContainer(container, processFilters);
			
			var local_point:Point = new Point();
			// translate to local
			if(final_rectangle){
				var local_point:Point = container.globalToLocal(new Point(final_rectangle.x, final_rectangle.y));
				final_rectangle = new Rectangle(local_point.x, local_point.y, final_rectangle.width, final_rectangle.height);		
			}else{
				final_rectangle = new Rectangle();
			}
			
			return final_rectangle;
		}
		
		public static function processDisplayObjectContainer(container:DisplayObjectContainer, processFilters:Boolean):Rectangle
		{
			var result_rectangle:Rectangle = null;
			
			// Process if container exists
			if (container != null) 
			{
				var index:int = 0;
				var displayObject:DisplayObject;
				
				// Process each child DisplayObject
				for(var childIndex:int = 0; childIndex < container.numChildren; childIndex++)
				{
					displayObject = container.getChildAt(childIndex);
					
					if(!displayObject)
					{
						continue;
					}
					//If we are recursing all children, we also get the rectangle of children within these children.
					if (displayObject is DisplayObjectContainer) 
					{
						
						// Let's drill into the structure till we find the deepest DisplayObject
						var displayObject_rectangle:Rectangle = processDisplayObjectContainer(displayObject as DisplayObjectContainer, processFilters);
						
						// Now, stepping out, uniting the result creates a rectangle that surrounds siblings
						if (result_rectangle == null) { 
							result_rectangle = displayObject_rectangle.clone(); 
						} else {
							result_rectangle = result_rectangle.union(displayObject_rectangle);
						}
					}
					else
					{
						var displayObject_rectangle:Rectangle = progressDisplayObject(displayObject, processFilters);
						if (result_rectangle == null)
						{ 
							result_rectangle = displayObject_rectangle.clone(); 
						} 
						else
						{
							result_rectangle = result_rectangle.union(displayObject_rectangle);
						}
					}
				}
				
				var displayObject_rectangle:Rectangle = progressDisplayObject(container, processFilters);
				
				// Now, stepping out, uniting the result creates a rectangle that surrounds siblings
				if (result_rectangle == null)
				{ 
					result_rectangle = displayObject_rectangle.clone(); 
				}
				else 
				{
					result_rectangle = result_rectangle.union(displayObject_rectangle);
				}
			}
			else 
			{
				throw new Error("No displayobject was passed as an argument");
			}
			
			return result_rectangle;
		}
		
		public static function progressDisplayObject(displayObject:DisplayObject, processFilters:Boolean):Rectangle{
			var result_rectangle:Rectangle = null;
			// Get bounds of current container, at this point we're stepping out of the nested DisplayObjects
			var container_rectangle:Rectangle = displayObject.getBounds(FP.stage);
			if (container_rectangle.height == 0 &&
				container_rectangle.width == 0) {
				return new Rectangle();
			}
			
			if (result_rectangle == null) { 
				result_rectangle = container_rectangle.clone(); 
			} else {
				result_rectangle = result_rectangle.union(container_rectangle);
			}
			
			
			// Include all filters if requested and they exist
			if ((processFilters == true) && (displayObject.filters.length > 0)) {
				var filterGenerater_rectangle:Rectangle = new Rectangle(0,0,result_rectangle.width, result_rectangle.height);
				var bmd:BitmapData = new BitmapData(MathUtil.clamp(result_rectangle.width, 1, 2880), MathUtil.clamp(result_rectangle.height, 1, 2880), true, 0x00000000);
				
				var filter_minimumX:Number = 0;
				var filter_minimumY:Number = 0;
				
				var filtersLength:int = displayObject.filters.length;
				for (var filtersIndex:int = 0; filtersIndex < filtersLength; filtersIndex++) {						
					var filter:BitmapFilter = displayObject.filters[filtersIndex];
					
					var filter_rectangle:Rectangle = bmd.generateFilterRect(filterGenerater_rectangle, filter);
					
					filter_minimumX = filter_minimumX + filter_rectangle.x;
					filter_minimumY = filter_minimumY + filter_rectangle.y;
					
					filterGenerater_rectangle = filter_rectangle.clone();
					filterGenerater_rectangle.x = 0;
					filterGenerater_rectangle.y = 0;
					
					bmd = new BitmapData(filterGenerater_rectangle.width, filterGenerater_rectangle.height, true, 0x00000000);						
				}
				
				// Reposition filter_rectangle back to global coordinates
				filter_rectangle.x = result_rectangle.x + filter_minimumX;
				filter_rectangle.y = result_rectangle.y + filter_minimumY;
				
				result_rectangle = filter_rectangle.clone();
			} 
			return result_rectangle;
		}
	}
}