package com.xiaoshu.admin.service.eraningsStatistics;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoshu.admin.entity.eraningsStatistics.EraningsStatistics;
import com.xiaoshu.admin.mapper.eraningsStatistics.EraningsStatisticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author sunzhenpeng
 * @data 2019/9/2
 * @description 收益统计 服务类
 */
@Service
public class EraningsStatisticsService extends ServiceImpl<EraningsStatisticsMapper,EraningsStatistics> {


    @Autowired
    private EraningsStatisticsMapper eraningsStatisticsMapper;

    /**
     * 会员收益统计
     * @author sunzhenpeng
     * @date 2019/9/2
     * @param
     * @return java.util.Map<java.lang.String,java.lang.Object>
     */
    public List<EraningsStatistics> vipUserEraningsList(EraningsStatistics eraningsStatistics){
        List<EraningsStatistics> vipUserEraningsList = eraningsStatisticsMapper.getEraningsStatistics(eraningsStatistics);
        return vipUserEraningsList;
    }

}
