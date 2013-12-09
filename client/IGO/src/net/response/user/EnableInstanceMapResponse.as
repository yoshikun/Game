/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 查询已完成副本地图返回(2:24)
     */
    public class EnableInstanceMapResponse implements IResponse
    {
        /**
         * 最后所在副本ID
         */
        public var lastID:uint;

        /**
         * 通过副本数量
         */
        public var num:uint;

        /**
         * 通过副本信息
         */
        public var infoList:Array /* of ThroughInsInfo */;

        public function read(p:Packet):void
        {

            lastID = p.readUnsignedInt();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var throughInsInfo:ThroughInsInfo = new ThroughInsInfo();
                throughInsInfo.id = p.readUnsignedInt();
                throughInsInfo.state = p.readUnsignedByte();
                infoList.push(throughInsInfo);
            }
        }
    }
}