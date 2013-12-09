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
     * 切换地图(5:18)
     */
    public class ChangeMapResponse implements IResponse
    {
        /**
         * 切入地图ID
         */
        public var sceneID:uint;

        public function read(p:Packet):void
        {

            sceneID = p.readUnsignedInt();
        }
    }
}