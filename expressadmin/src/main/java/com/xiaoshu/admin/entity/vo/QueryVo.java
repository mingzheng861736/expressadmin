package com.xiaoshu.admin.entity.vo;

import com.xiaoshu.common.util.DateUtils;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import java.text.ParseException;
import java.util.Date;

/**
 * 封装前台传递过来的查询条件
 * @param <T>
 */
@Data
public class QueryVo<T> {

    private T data;
    private Integer pageNo = 1;//起始页面
    private Integer pageSize = 10;//页面大小
    private String startTime;//起始时间
    private String endTime;//结束时间

    public String getEndTime() {
        if (StringUtils.isBlank(endTime)) {
            try {
                endTime = DateUtils.dateFormat(new Date(), DateUtils.DATE_TIME_PATTERN);
            } catch (ParseException e) {
            }
        }
        return endTime;
    }
}