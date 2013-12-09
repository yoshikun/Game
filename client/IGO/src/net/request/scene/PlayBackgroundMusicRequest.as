/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 播放背景音乐(5:87)
     */
    public class PlayBackgroundMusicRequest implements IRequest
    {
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 87;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}