package com.zfl.mapper;

import com.zfl.entity.TbFundInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 交易金额表 Mapper 接口
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Repository
public interface TbFundInfoMapper extends BaseMapper<TbFundInfo> {
    double accumulativeSum(Integer userId);
    double recommendSum(Integer userId);
    double mySum(Integer userId);
}
