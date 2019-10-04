package com.zfl.entity.vo;

import com.zfl.exception.GlobalException;
import com.zfl.result.CodeMsg;
import lombok.Data;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.constraints.NotBlank;
import java.util.Iterator;
import java.util.Set;

/**
 * @program:UserBean
 * @description: 登录用户对象
 * @author: zc
 * @create:
 **/
@Data
public class UserBean {

    @NotBlank(message = "用户名不能为空")
    private String userName;

    @NotBlank(message = "密码不能为空")
    private String passWord;
    public void validateParams() {
        //调用JSR303验证工具，校验参数
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<UserBean>> violations = validator.validate(this);
        Iterator<ConstraintViolation<UserBean>> iter = violations.iterator();
        if (iter.hasNext()) {
            String errMessage = iter.next().getMessage();
            throw new GlobalException(CodeMsg.BIND_ERROR.fillArgs(errMessage));
        }
    }
}
