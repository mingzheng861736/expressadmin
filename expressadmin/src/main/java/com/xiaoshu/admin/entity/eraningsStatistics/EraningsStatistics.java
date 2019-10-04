package com.xiaoshu.admin.entity.eraningsStatistics;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author sunzhenpeng
 * @data 2019/9/3
 * @description 收益统计 实体类
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class EraningsStatistics implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * 账号
     */
    private String account;


    /**
     * 名称、昵称
     */
    private String name;

    /**
     * 用户类型
     */
    private String userType;

    /**
     * vip等级
     */
    private String vipRank;

    /**
     * 用户状态
     */
    private String status;

    /**
     * 用户所在区域
     */
    private String userArea;

    /**
     * 开始时间
     */
    private String startDate;

    /**
     * 结束时间
     */
    private String endDate;

    /**
     * 收益
     */
    private String eranings;

    /**
     * 日期
     */
    private String date;
}
