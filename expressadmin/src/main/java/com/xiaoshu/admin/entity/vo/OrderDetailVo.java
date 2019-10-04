package com.xiaoshu.admin.entity.vo;

import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.entity.TbOddNum;
import com.xiaoshu.admin.entity.TbPayType;
import lombok.Data;

/**
 * @program: expressadmin->OrderDetailVo
 * @description: 点击进入订单明细页面
 * @author: zc
 * @create: 2019-09-03 15:11
 **/
@Data
public class OrderDetailVo extends TbOddNum {

    private AdminUser adminUser;

    private String senderInfo;

    private String recipientsInfo;

    private TbPayType tbPayType;

    private String addTimes;

    private String outOddNumTimes;

    private String deliveryTimes;
    private String pickUpTimes;
    private String accomplishTimes;



}
