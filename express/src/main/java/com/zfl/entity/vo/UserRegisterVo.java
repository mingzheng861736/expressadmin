package com.zfl.entity.vo;

import com.zfl.entity.SupperEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @program: express->UserRegisterVo
 * @description: 用户注册对象
 * @author: zc
 * @create: 2019-09-04 11:41
 **/
@Data
public class UserRegisterVo extends SupperEntity {

    @NotBlank(message = "用户名不能为空")
    private String account;

    @NotBlank(message = "用户密码不能为空")
    private String password;

    @NotBlank(message = "用户所在区域不能为空")
    private String area;

    private String inviteCode;

    @NotBlank(message = "验证码不能为空")
    private String verifyCode;

}
