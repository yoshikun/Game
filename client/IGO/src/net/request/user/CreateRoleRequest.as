/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 创建角色(2:3)
     */
    public class CreateRoleRequest implements IRequest
    {
        /**
         * 账号
         */
        public var accName:String;
    
        /**
         * 角色名称
         */
        public var nickname:String;
    
        /**
         * 渠道类型
         */
        public var originType:uint;
    
        /**
         * 渠道ID
         */
        public var originID:uint;
    
        /**
         * 种族
         */
        public var type:uint;
    
        /**
         * 性别
         */
        public var sex:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(accName, 48);
            p.writeMultiBytes(nickname, 33);
            p.writeUnsignedInt(originType);
            p.writeUnsignedInt(originID);
            p.writeByte(type);
            p.writeByte(sex);
        }
    }
}