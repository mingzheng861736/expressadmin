package com.xiaoshu.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.TbTodayPrice;
import com.xiaoshu.admin.entity.vo.OfferPriceSearchVo;

import java.util.List;

/**
 * <p>
 * 今天该快递该区域当前快递价格表 服务类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
public interface TbTodayPriceService extends IService<TbTodayPrice> {
    List<TbTodayPrice> listByCondition(OfferPriceSearchVo offerPriceSearchVo);
}
