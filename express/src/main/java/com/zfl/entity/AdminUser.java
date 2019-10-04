package com.zfl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class AdminUser implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 账号
     */
    private String account;

    /**
     * 密码
     */
    private String pass;

    /**
     * 名称
     */
    private String name;

    /**
     * 状态
     */
    private Boolean status;

    /**
     * 是否软删除  0：删  1：不删
     */
    private Integer softDelete;

    /**
     * 修改人
     */
    private Integer updatePerson;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    /**
     * 删除人
     */
    private Integer deletePerson;

    /**
     * 删除时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date deleteTime;

    /**
     * 创建人
     */
    private Integer createPerson;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 用户vip
     */
    private Integer userVip;

    /**
     * 密码盐值
     */
    private String userSalt;

    /**
     * 用户区域
     */
    private String userArea;
    /**
     * 邀请码
     */
    private String userInviteCode;

    /*
     *用户类型
     */
    private Integer userType;

    /**
     * 用户余额（积分余额）
     */
    private double remainingSum;



}
