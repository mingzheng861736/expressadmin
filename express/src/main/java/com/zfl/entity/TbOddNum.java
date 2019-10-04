package com.zfl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import javafx.scene.text.TextBoundsType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 收单  订单表
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbOddNum implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 订单用户
     */
    private Integer userId;

    /**
     * 发件人信息
     */
    private String addresser;

    /**
     * 收件人信息
     */
    private String recipients;

    /**
     * 商品信息
     */
    private String goodInfo;

    /**
     * 发货方式   关联字段
     */
    private Integer modeOfDespatch;

    /**
     * 订单状态  0待支付   1待出单   2已出单  3待取件   4已取件  5待发货  6已发货  7已签收  8已完成
     */
    private Integer orderState;

    /**
     * 添加时间  支付时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date addTime;

    /**
     * 出单时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date outOddNumTime;

    /**
     * 取件时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date pickUpTime;

    /**
     * 发货时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date deliveryTime;

    /**
     * 完成时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date accomplishTime;

    /**
     * 取件人  快递员  代理
     */
    private Integer pickUpPerson;

    /**
     * 出单人
     */
    private String outOddNumPerson;

    /**
     * 支付方式   关联字段
     */
    private Integer payType;

    /**
     * 系统单号
     */
    private String sysNum;

    /**
     * 快递单号
     */
    private String trackingNumber;

    /**
     * 快递公司  关联字段
     */
    private Integer trackingCompany;

    /**
     * 支付金额
     */
    private Double payPrice;

    /**
     * 订单所在区域   关联字段
     */
    private String orderArea;

    /**
     * 第三方支付平台订单号
     */
    private String tripartiteOrderNum;

    /**
     * 寄件方式
     *
     */
    private Integer senderType;

    /**
     * 是否取消订单 1为 是，0为 否
     *
     */
    private Integer isCancel;

    /**
     * 物品类型
     */
    private String stdmode;

    /**
     * 快递成本
     */
    private double courierCost;

    /**
     * 备注
     */
    private String remarks;

    @TableField(exist = false)
    private AdminUser adminUser;
    @TableField(exist = false)
    private TbTracking tbTracking;
    @TableField(exist = false)
    private TbArea tbArea;
    @TableField(exist = false)
    private  TbSender tbSender;
    @TableField(exist = false)
    private TbPayType tbPayType;

    @TableField(exist = false)
    private TbStdmode stdmodepe;

    @TableField(exist = false)
    private TbUserInfo tbUserInfo;

}
