package com.xiaoshu.common.exception;

import com.xiaoshu.common.result.CodeMsg;
import com.xiaoshu.common.result.Result;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@ControllerAdvice
@ResponseBody
public class GlobalExceptionHandler {
	@ExceptionHandler(value=Exception.class)
	public Result<String> exceptionHandler(HttpServletRequest request, Exception e){
		if(e instanceof GlobalException) {
			GlobalException ex = (GlobalException)e;
			return Result.error(ex.getCm());
		}else if(e instanceof BindException) {
			BindException ex = (BindException)e;
			List<ObjectError> errors = ex.getAllErrors();
			ObjectError error = errors.get(0);
			String msg = error.getDefaultMessage();
			return Result.error(CodeMsg.BIND_ERROR.fillArgs(msg));
		}else if (e instanceof HttpMediaTypeNotSupportedException){
			HttpMediaTypeNotSupportedException ex = (HttpMediaTypeNotSupportedException)e;
			String msg = ex.getMessage();
			return Result.error(CodeMsg.REQUEST_ERROR.fillArgs(msg));
		}else if (e instanceof HttpMessageNotReadableException){
			HttpMessageNotReadableException ex = (HttpMessageNotReadableException)e;
			String msg = ex.getMessage();
			return Result.error(CodeMsg.REQUEST_PARAMETERS_ERROR.fillArgs(msg));
		}else {
			return new Result<>(500101,"服务端异常",e.getMessage());
		}
	}
}
