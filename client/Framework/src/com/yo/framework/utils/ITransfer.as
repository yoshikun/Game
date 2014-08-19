package com.yo.framework.utils
{
	public interface ITransfer
	{
		function getScreenX(x:Number):Number;
		function getScreenY(y:Number, z:Number = 0):Number;
		function get cellWidth():Number;
		function get cellHeight():Number;
		function getNodeIndex(a:Vector2D):int;
		function getCellX(x:Number):int;
		function getCellY(y:Number):int;
		function get maxColumn():int;
		function get maxRow():int;
	}
}