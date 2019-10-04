package com.zfl.entity;

import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 省市县数据表
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbProvinceCityDistrict implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 地区代码
     */
    private Integer id;

    /**
     * 当前地区的上一级地区代码
     */
    private Integer pid;

    /**
     * 地区名称
     */
    private String name;


}
