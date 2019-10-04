package com.zfl.entity.vo;

import com.zfl.entity.SupperEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author sunzhenpeng
 * @data 2019/9/23
 * @description 用户认证
 */
@Data
public class UserAuthenticationVo extends SupperEntity {

    @NotBlank(message = "姓名不能为空！")
    private String userName;
    @NotBlank(message = "电话不能为空！")
    private String userPhone;
    @NotBlank(message = "身份证号不能为空！")
    private String userCard;
    @NotBlank(message = "证件照不能为空！")
    private String cardNumImage;
}
