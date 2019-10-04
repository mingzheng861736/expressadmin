package com.zfl.entity;

import com.zfl.exception.GlobalException;
import com.zfl.result.CodeMsg;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Iterator;
import java.util.Set;

public class SupperEntity {

    public void validateParams() {
        //调用JSR303验证工具，校验参数
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Object>> violations = validator.validate(this);
        Iterator<ConstraintViolation<Object>> iter = violations.iterator();
        if (iter.hasNext()) {
            String errMessage = iter.next().getMessage();
            throw new GlobalException(CodeMsg.BIND_ERROR.fillArgs(errMessage));
        }
    }

}
