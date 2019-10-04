package com.zfl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统权限表
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class AdminPermission implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 父ID（一级导航：0）
     */
    private Integer pid;

    /**
     * 权限标识
     */
    private String componentName;

    /**
     * 组件名称
     */
    private String permissionSign;

    /**
     * 是否显示（1：显示，0：不显示）
     */
    private Integer sidebarShow;

    /**
     * 路由名称
     */
    private String urlName;

    /**
     * 路由地址
     */
    private String urlPath;

    /**
     * 描述
     */
    private String description;


}
