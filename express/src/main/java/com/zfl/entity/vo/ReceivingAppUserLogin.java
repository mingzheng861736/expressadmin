package com.zfl.entity.vo;

import com.zfl.entity.SupperEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @program: express->receivingAppUserLogin
 * @description: 收货app用户登录
 * @author: zc
 * @create: 2019-08-28 16:01
 **/
@Data
public class ReceivingAppUserLogin extends SupperEntity {

    @NotBlank(message = "用户名不能为空")
    private String account;

    @NotBlank(message = "密码不能为空")
    private String password;

    private String verifyCode;


}
