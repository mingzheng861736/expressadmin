package com.zfl.service;

import com.zfl.entity.TbFundInfo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 交易金额表 服务类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
public interface TbFundInfoService extends IService<TbFundInfo> {
    double accumulativeSum(Integer userId);
    double recommendSum(Integer userId);
    double mySum(Integer userId);
}
