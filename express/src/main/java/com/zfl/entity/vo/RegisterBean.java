package com.zfl.entity.vo;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;

/**
 * <p>
 *注册时用到的Bean,跟AdminUser一样,只是多了个用户角色role
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class RegisterBean implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */

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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
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
     * 用户角色
     */
    @NotNull(message = "角色不能为空")
    private  Integer role;
}
