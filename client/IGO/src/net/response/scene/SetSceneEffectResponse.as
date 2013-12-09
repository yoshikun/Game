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
     * 设置场景特效(5:68)
     */
    public class SetSceneEffectResponse implements IResponse
    {
        /**
         * 特效ID
         */
        public var id:uint;

        /**
         * 效果值
         */
        public var value:uint;

        /**
         * 效果值1
         */
        public var value1:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            value = p.readUnsignedInt();
            value1 = p.readUnsignedInt();
        }
    }
}