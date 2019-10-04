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
 * 用户明细表
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TbUserInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户编号
     */
    private Integer userId;

    /**
     * 用户照片地址
     */
    private String userImg;

    /**
     * 用户明细添加时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date userInfoAddTime;

    /**
     * 用户明细更新时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date userInfoUpdateTime;

    /**
     * 用户明细   json字符串
     */
    private String userInfoJson;

    /**
     * 用户地址
     */
    private String userAddress;

    /**
     * 用户手机号
     */
    private String userTel;

    /**
     * 用户所在区域
     */
    private String userArea;

    /**
     * 身份证照片
     */
    private String cardNumImage;


    /**
     * 是否认证 0为 是，1为 否，2为 请求认证
     */
    private Integer isCertification;

}
