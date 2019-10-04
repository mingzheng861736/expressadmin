package com.zfl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * @author sunzhenpeng
 * @data 2019/9/17
 * @description 代理申请表
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbAgencyApply extends SupperEntity implements Serializable  {

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户编号
     */
    private Integer userId;

    /**
     * 区域编码
     */
    private Integer areaId;

    /**
     * 身份证号
     */
    private String cardNumber;

    /**
     * 电话号码
     */
    private String telNumber;

    /**
     * 申请理由
     */
    private String applyReason;

    /**
     * 是否通过
     */
    private Integer isPass;

    /**
     * 审核状态
     */
    private Integer auditStatus;

    /**
     * 审核理由
     */
    private String auditReason;

    /**
     * 申请时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
}
