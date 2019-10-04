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
 * @data 2019/9/12
 * @description 订单表
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 订单编号
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;

    /**
     * 商品Id
     */
    private Integer goodsId;

    /**
     * 商品数量
     */
    private Integer goodsNum;

    /**
     * 用户Id
     */
    private Integer userId;

    /**
     * 下单时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date orderTime;

    /**
     * 商品总额
     */
    private double goodsPriceTotal;

    /**
     * 支付金额
     */
    private double payAmount;

    /**
     * 支付状态
     */
    private Integer orderStatus;

    /**
     * 支付时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date payTime;

    /**
     * 联系电话
     */
    private String userTel;


}
