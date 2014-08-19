package com.yo.framework.utils
{
	import flash.utils.ByteArray;
	
	/**
	 * inline bool isset_state(const unsigned char *state, const int teststate)
	 *	{
	 *	    return 0 != (state[teststate / 8] & (0xff & (1 << (teststate % 8))));
	 *	}
	 *	
	 *	/// 设置某个状态
	 *	inline void set_state(unsigned char *state, const int teststate)
	 *	{
	 *	    state[teststate / 8] |= (0xff & (1 << (teststate % 8)));
	 *	}
	 *	
	 *	/// 清除某个状态
	 *	inline void clear_state(unsigned char *state, const int teststate)
	 *	{
	 *	    state[teststate / 8] &= (0xff & (~(1 << (teststate % 8))));
	 *	}
	 */
	public class ByteArrayUtil
	{
		
		public static function getBit(byteArray:ByteArray, position:uint):Boolean{
			var index:int = position >> 3;
			var offset:int = position & 7;
			var tempByte:int = byteArray[index];
			var result:uint = tempByte & (1 << offset);
			if(result){
				return true;
			}
			return false;
		}
		
		public static function setBit(byteArray:ByteArray, position:uint, value:Boolean):void{
			if(value){
				byteArray[int(position / 8)] |= (0xff & (1 << (position % 8)));
			}else{
				byteArray[int(position / 8)] &= (0xff & (~(1 << (position % 8))));
			}
		}
	}
}