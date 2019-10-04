package com.zfl.controller.app.shipmentsapp;
import com.alipay.api.AlipayApiException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.TbOddNum;
import com.zfl.service.TbOddNumService;
import com.zfl.service.payservice.AliPayService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
/**
 * @author sunzhenpeng
 * @data 2019/9/27
 * @description 支付，控制器
 */
@RestController
@RequestMapping("/pay")
public class PayController {

    @Autowired
    private AliPayService aliPayService;
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private TbOddNumService tbOddNumService;

    @ResponseBody
    @RequestMapping(value = "/callback", produces = "text/plain;charset=utf-8")
    public String aliNotify(String trade_no, String trade_status, String total_amount, String out_trade_no, HttpServletResponse response)
            throws AlipayApiException, IOException {

        System.out.println("进入网关支付完成！！！！");
        //out_trade_no 下单时传入的订单号
        PrintWriter out = response.getWriter();
        System.out.println("进入网关支付完成！！！！" + trade_no + " ---" + trade_status + "---" + total_amount + "----" + out_trade_no);
        if ("TRADE_SUCCESS".equals(trade_status)) {
            System.out.println("支付成功！");
            //修改订单状态

            return "success";
        } else {
            System.out.println("支付失败！");
            return "fail";
        }

    }

    @RequiresAuthentication
    @GetMapping("toPayUri")
    public String toPayUri(ModelMap model,String sysNum) {
        List<TbOddNum> orderslist = tbOddNumService.list(new QueryWrapper<TbOddNum>().eq("sys_num",sysNum));
        if(orderslist.size()>0&&orderslist!=null){
            TbOddNum tbOddNum = orderslist.get(0);
            model.addAttribute("payUrl",tbOddNum.getTripartiteOrderNum());
        }else{
            model.addAttribute("payUrl","支付出错了！！！");
        }
        return  getUrl()+"index";
    }
    private String getUrl(){
        StringBuffer url = request.getRequestURL();
        String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append(request.getServletContext().getContextPath()).append("/").toString();
        System.out.println("当前项目url:"+tempContextUrl);
        return tempContextUrl;
    }
}
