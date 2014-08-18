package com.yo.game.data.cache.decoder
{
	import com.yile.games.doll.ui.guild.DictionaryData;

	public interface IXMLDecoder
	{
		function get data():DictionaryData;
		
		function set data(value:DictionaryData):void;
	}
}