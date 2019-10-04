package com.xiaoshu.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoshu.admin.entity.TbFundInfo;
import com.xiaoshu.admin.mapper.TbFundInfoMapper;
import com.xiaoshu.admin.service.TbFundInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 交易金额表 服务实现类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Service
public class TbFundInfoServiceImpl extends ServiceImpl<TbFundInfoMapper, TbFundInfo> implements TbFundInfoService {
   @Autowired
    TbFundInfoMapper tbFundInfoMapper;
   public  double accumulativeSum(Integer userId){
       return tbFundInfoMapper.accumulativeSum(userId);
   }
    public  double recommendSum(Integer userId){
        return tbFundInfoMapper.recommendSum(userId);
    }
    public  double mySum(Integer userId){
        return tbFundInfoMapper.mySum(userId);
    }

    public List<TbFundInfo> getTbFundInfoList (TbFundInfo tbFundInfo){
       return tbFundInfoMapper.getTbFundInfoList(tbFundInfo);
    }
}
