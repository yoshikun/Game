/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 训练英雄(15:8)
     */
    public class TrainHeroResponse implements IResponse
    {
        /**
         * 0成功 1时间限制 2英雄限制 3没有英雄 4没有此栏位 5英雄等级达到上限
         */
        public var ret:uint;

        /**
         * 栏位ID（1,2,3,4）
         */
        public var id:uint;

        /**
         * 英雄ID
         */
        public var heroID:uint;

        /**
         * 训练时常（秒数）
         */
        public var trainTime:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedShort();
            heroID = p.readUnsignedInt();
            trainTime = p.readUnsignedInt();
        }
    }
}