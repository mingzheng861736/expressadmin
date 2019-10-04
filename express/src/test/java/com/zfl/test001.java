package com.zfl;

import com.zfl.service.payservice.AliPayService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;

public class test001 {
    @Autowired
    AliPayService aliPayService;
    @Test
    public void m() {
        aliPayService.getPreOrder("",0.01, Calendar.getInstance().getTimeInMillis()+"");
    }
}
