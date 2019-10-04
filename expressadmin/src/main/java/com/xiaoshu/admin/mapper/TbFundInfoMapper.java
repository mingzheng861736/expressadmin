package com.xiaoshu.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaoshu.admin.entity.TbFundInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    List<TbFundInfo> getTbFundInfoList (TbFundInfo tbFundInfo);
}
