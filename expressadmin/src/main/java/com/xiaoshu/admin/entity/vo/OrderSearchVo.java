package com.xiaoshu.admin.entity.vo;

import lombok.Data;

/**
 * @program: expressadmin->OrderSearchVo
 * @description: 订单搜索   对象
 * @author: zc
 * @create: 2019-09-03 11:54
 **/
@Data
public class OrderSearchVo {

    private String account;

    private String pickUpPerson;

    private String startTime;

    private String endTime;

    private String trackingNumber;

    private String payType;

    private String orderStatu;

    private String orderArea;
}
