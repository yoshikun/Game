package iso
{
	public class DrawnIsoBox extends DrawnIsoTile{
		
		public function DrawnIsoBox(size:Number, color:uint, height:Number){
			super(size, color, height);
		}
		
		override protected function draw():void{
			graphics.clear();
			
			//提取r,g,b三色分量
			var red:int=_color >> 16;
			var green:int=_color >> 8&0xff;
			var blue:int=_color & 0xff;
			
			//假如光源在右上方（所以左侧最暗，顶上最亮，右侧在二者之间）
			var leftShadow:uint = (red * 0.5) << 16 |(green * 0.5) << 8 |(blue * 0.5);
			var rightShadow:uint = (red * 0.75) << 16 |(green * 0.75) << 8 | (blue * 0.75);
			var h:Number=_height * Y_CORRECT;
			
			//顶部
			graphics.beginFill(_color);
			graphics.lineStyle(0, 0, 0.5);
			graphics.moveTo(-_size, -h);
			graphics.lineTo(0, -_size * 0.5 -h);
			graphics.lineTo(_size, -h);
			graphics.lineTo(0, _size * 0.5 -h);
			graphics.lineTo(-_size, -h);
			graphics.endFill();
			
			//左侧
			graphics.beginFill(leftShadow);
			graphics.lineStyle(0, 0, 0.5);
			graphics.moveTo(-_size, -h);
			graphics.lineTo(0, _size * 0.5 -h);
			graphics.lineTo(0, _size * 0.5);
			graphics.lineTo(-_size, 0);
			graphics.lineTo(-_size, -h);
			graphics.endFill();
			
			//右侧
			graphics.beginFill(rightShadow);
			graphics.lineStyle(0, 0, 0.5);
			graphics.moveTo(_size, -h);
			graphics.lineTo(0, _size * 0.5 -h);
			graphics.lineTo(0, _size * 0.5);
			graphics.lineTo(_size, 0);
			graphics.lineTo(_size, -h);
			graphics.endFill();
		}
	}
}