package com.zfl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.util.Date;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 提现表
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbDraw extends SupperEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 提现金额
     */
    private Double drawPrice;

    /**
     * 提现用户id   关联字段
     */
    private Integer drawUserId;

    /**
     * 提现手续费
     */
    private String drawServiceCharge;

    /**
     * 提现状态 0待审核   1已通过  2已驳回
     */
    private Integer drawStatu;

    /**
     * 提现通过的人
     */
    private String drawPassUser;

    /**
     * 提现申请时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date drawAddTime;

    /**
     * 提现更新时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date drawUpdateTime;

    /**
     * 提现描述
     */
    private String drawInfo;

    /**
     * 提现到账账户
     */
    private String drawAccount;


}
