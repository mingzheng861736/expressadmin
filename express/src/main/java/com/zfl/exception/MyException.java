package com.zfl.exception;

/**
 * @author zc
 * @create 2019 - 03 - 06
 **/
public class MyException extends RuntimeException {
    public Object exceptionData;

    public void setData(Object o){
        this.exceptionData=o;
    }
    public Object getExceptionData(){
        return  this.exceptionData;
    }
}
