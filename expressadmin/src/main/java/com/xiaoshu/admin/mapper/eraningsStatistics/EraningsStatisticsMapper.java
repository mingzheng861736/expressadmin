package com.xiaoshu.admin.mapper.eraningsStatistics;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaoshu.admin.entity.eraningsStatistics.EraningsStatistics;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author sunzhenpeng
 * @data 2019/9/2
 * @description 收益统计Mapper
 */
@Repository
public interface EraningsStatisticsMapper extends BaseMapper<EraningsStatistics> {

    List<EraningsStatistics> getEraningsStatistics(EraningsStatistics eraningsStatistics);
}
