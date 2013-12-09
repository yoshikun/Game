/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 邮件头信息
     */
    public class MailHeadInfo
    {
        /**
         * 唯一id
         */
        public var id:uint;

        /**
         * 状态 1新 2查看过 3删除
         */
        public var state:uint;

        /**
         * 发件人
         */
        public var title:String;

        /**
         * 发件人
         */
        public var fromName:String;

        /**
         * 删除时间
         */
        public var delTime:uint;

        /**
         * 创建时间
         */
        public var createTime:uint;

        /**
         * 是否有附件 0没有 1有
         */
        public var accessory:uint;

        /**
         * 附件是否领取过 0未取 1已取过
         */
        public var itemGot:uint;

        /**
         * 邮件类型 1系统 2普通邮件 3留言 4退回的邮件
         */
        public var type:uint;

    }
}