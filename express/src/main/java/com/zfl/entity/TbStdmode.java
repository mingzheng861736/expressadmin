package com.zfl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author sunzhenpeng
 * @data 2019/9/10
 * @description 物品类型表
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbStdmode implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 物品类型
     */
    private String stdmode;
}
