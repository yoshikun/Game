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
     * 获得的宠物信息返回(2:28)
     */
    public class ObtainPetInfoParaResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 获得的宠物信息
         */
        public var infoList:Array /* of ObtainPet */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var obtainPet:ObtainPet = new ObtainPet();
                obtainPet.id = p.readUnsignedInt();
                obtainPet.state = p.readUnsignedByte();
                infoList.push(obtainPet);
            }
        }
    }
}