package com.xiaoshu.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaoshu.admin.entity.TbOrder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author sunzhenpeng
 * @data 2019/9/12
 * @description 订单表 接口
 */
@Repository
public interface TbOrderMapper extends BaseMapper<TbOrder> {

    List<TbOrder> outstandingOrder ();//获取未付清订单
}
