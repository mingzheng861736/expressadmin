package com.xiaoshu.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoshu.admin.entity.TbOrder;
import com.xiaoshu.admin.mapper.TbOrderMapper;
import com.xiaoshu.admin.service.TbOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author sunzhenpeng
 * @data 2019/9/12
 * @description 订单表 服务
 */
@Service
public class TbOrderServiceImpl extends ServiceImpl<TbOrderMapper, TbOrder> implements TbOrderService {

    @Autowired
    private TbOrderMapper tbOrderMapper;
    @Override
    public List<TbOrder> outstandingOrder() {
        return tbOrderMapper.outstandingOrder();
    }
}
