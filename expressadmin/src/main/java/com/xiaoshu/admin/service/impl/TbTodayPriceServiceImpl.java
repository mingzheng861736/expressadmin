package com.xiaoshu.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoshu.admin.entity.TbTodayPrice;
import com.xiaoshu.admin.entity.vo.OfferPriceSearchVo;
import com.xiaoshu.admin.mapper.TbTodayPriceMapper;
import com.xiaoshu.admin.service.TbTodayPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 今天该快递该区域当前快递价格表 服务实现类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Service
public class TbTodayPriceServiceImpl extends ServiceImpl<TbTodayPriceMapper, TbTodayPrice> implements TbTodayPriceService {

    @Autowired
    private TbTodayPriceMapper tbTodayPriceMapper;

    @Override
    public List<TbTodayPrice> listByCondition(OfferPriceSearchVo offerPriceSearchVo) {

        return tbTodayPriceMapper.selectList(null);
    }
}
