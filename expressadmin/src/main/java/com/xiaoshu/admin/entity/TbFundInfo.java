package com.xiaoshu.admin.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 交易金额表
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbFundInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 用户id对应的用户昵称
     */
    private String userName;

    /**
     * 0支出   1收入
     */
    private Integer fundType;

    /**
     * 0支出   1收入 中文名称
     */
    private String fundTypeNmae;

    /**
     * 金额
     */
    private Double money;

    /**
     * 添加时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date addTime;

    /**
     * 金额  用途
     */
    private Integer moneyPurpose;

    /**
     * 金额  用途purpose_info
     */
    private String moneyPurposeName;

    /**
     * 金额  用途
     */
    private String purposeInfo;


    private String startDate;

    private String endDate;

    private String account;
}
