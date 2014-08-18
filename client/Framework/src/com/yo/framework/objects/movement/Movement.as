package com.yo.framework.objects.movement
{
	import com.yo.framework.objects.entity.EntityComponent;
	import com.yo.framework.objects.entity.MovingEntity;
	
	public class Movement extends EntityComponent
	{
		protected var _owner:MovingEntity;
		
		public function Movement(owner:MovingEntity)
		{
			_owner = owner;
            _owner.addComponent(this);
		}
		
        public function add():void
		{
            
        }
        
        public function remove():void 
		{
            _owner.removeComponent(this);
        }
        
	}
}