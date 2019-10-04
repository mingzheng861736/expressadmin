package com.xiaoshu.admin.entity.vo;

import lombok.Data;

/**
 * @program: expressadmin->OfferPriceVo
 * @description: 快递报价搜索对象
 * @author: zc
 * @create: 2019-09-04 09:04
 **/
@Data
public class OfferPriceSearchVo {

    private String tracking;

    private String starTime;

    private String endTime;

}
