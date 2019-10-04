package com.zfl.service.impl;

import com.zfl.entity.TbFundInfo;
import com.zfl.mapper.TbFundInfoMapper;
import com.zfl.service.TbFundInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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



   @Override
   public  double accumulativeSum(Integer userId){
       return tbFundInfoMapper.accumulativeSum(userId);
   }
    @Override
    public  double recommendSum(Integer userId){
        return tbFundInfoMapper.recommendSum(userId);
    }
    @Override
    public  double mySum(Integer userId){
        return tbFundInfoMapper.mySum(userId);
    }
}
