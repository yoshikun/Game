/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 通知限时活动状态(13:20)
     */
    public class ReqDareStateResponse implements IResponse
    {
        /**
         * 类型 数量
         */
        public var num:uint;

        /**
         * 类型 数量
         */
        public var infoList:Array /* of DareStateInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var dareStateInfo:DareStateInfo = new DareStateInfo();
                dareStateInfo.type = p.readUnsignedByte();
                dareStateInfo.state = p.readUnsignedByte();
                infoList.push(dareStateInfo);
            }
        }
    }
}