package com.xiaoshu.admin.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 今天该快递该区域当前快递价格表
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbTodayPrice implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 快递公司
     */
    private String tracking;

    /**
     * 区域
     */
    private String area;

    /**
     * 今日快递报价
     */
    private Double todayPrice;

    /**
     * 今日用户报价
     */
    private Double todayUserPrice;

    /**
     * 今日
     */
    private String today;

    /**
     * 添加
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date addTime;

    @TableField(exist = false)
    private TbTracking tbTracking;
    @TableField(exist = false)
    private TbArea tbArea;

}
