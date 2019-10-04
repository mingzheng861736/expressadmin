package com.xiaoshu.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.TbOddNum;
import com.xiaoshu.admin.entity.vo.OrderDetailVo;
import com.xiaoshu.admin.entity.vo.OrderSearchVo;
import com.xiaoshu.common.base.PageData;

/**
 * <p>
 * 收单  订单表 服务类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
public interface TbOddNumService extends IService<TbOddNum> {

    PageData<TbOddNum> listByCondition(Integer page, Integer limit, OrderSearchVo orderSearchVo);

    OrderDetailVo getOrderDetail(TbOddNum tbOddNum);
}
