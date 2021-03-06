package com.xiaoshu.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.TbOrder;

import java.util.List;

/**
 * @author sunzhenpeng
 * @data 2019/9/12
 * @description 订单表 服务类
 */
public interface TbOrderService extends IService<TbOrder> {
    List<TbOrder> outstandingOrder ();//获取未付清订单
}
