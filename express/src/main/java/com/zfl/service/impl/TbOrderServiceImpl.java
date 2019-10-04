package com.zfl.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zfl.entity.TbOrder;
import com.zfl.mapper.TbOrderMapper;
import com.zfl.service.TbOrderService;
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
    public List<TbOrder> outstandingOrder(Integer userId) {
        return tbOrderMapper.outstandingOrder(userId);
    }
}
