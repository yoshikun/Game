/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 播放背景音乐(5:88)
     */
    public class PlayBackgroundMusicResponse implements IResponse
    {
        /**
         * 音乐名称
         */
        public var name:String;

        public function read(p:Packet):void
        {

            name = p.readMultiByte(33, "utf-8");
        }
    }
}