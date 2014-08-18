package com.yo.game.objects
{
	import com.yo.framework.manager.layer.GameLayer;
	import com.yo.framework.objects.animator.MovieClipAnimator;
	import com.yo.framework.objects.render.BitmapRenderer;
	import com.yo.framework.scene.GameScene;
	import com.yo.game.data.vo.EntityVo;
	
	import flash.display.DisplayObject;

	public class EntityFactory
	{
		private static var _instance:EntityFactory;
		
		public function EntityFactory()
		{
		}

		public function createPlayer(vo:EntityVo, scene:GameScene):Player
		{
			var player:Player = new Player();
			player.animator = new MovieClipAnimator(vo.name, vo.type);
			player.animator.play("idle");
			player.renderer = new BitmapRenderer();
			player.vo = vo;
			scene.addEntity(player);
			scene.addChild(player.renderer as DisplayObject, GameLayer.OBJECT);
			return player;
		}
		
		public static function get instance():EntityFactory
		{
			if(!_instance)
			{
				_instance = new EntityFactory();
			}
			return _instance;
		}

	}
}