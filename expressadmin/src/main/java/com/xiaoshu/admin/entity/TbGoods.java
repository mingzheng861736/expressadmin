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
 * @author sunzhenpeng
 * @data 2019/9/12
 * @description 商品表
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbGoods implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 商品编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品图片
     */
    private String goodsImages;

    /**
     * 商品价格
     */
    private Double goodsPrice;
    /**
     * 商品兑换所需积分
     */
    private Double goodsIntegralPrice;
    /**
     * 商品兑换所需现金（扣除积分后所需要的现金）
     */
    private Double goodsMoneyPrice;

    /**
     * 商品兑换所需最小积分
     */
    private Double minConvertibility;

    /**
     * 商品库存、数量
     */
    private Integer goodsStockpile;

    /**
     * 是否可预支积分，0为 是，1为 否
     */
    private Integer isAdvance;

    /**
     * 商品详情
     */
    private String goodsInfo;

    /**
     * 商品是否上架
     */
    private Integer isPutaway;
    /**
     * 商品是否上架
     */
    private Integer goodsStagingPeriod;

    /**
     * 商品创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 商品更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
}
