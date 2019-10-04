package com.example.demo.shouji;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@RestController
public class testController {
    @RequestMapping("/")
    public void aa(){
        System.out.println("s----------------------------");
    }

    @RequestMapping("/getContext")
    public void alipayPayChongRequest(HttpServletResponse response) throws Exception {
        AlipayClient alipayClient = AlipayConfig.getAlipayClient();
        //创建API对应的request类(主要是这里变化了)
        AlipayTradeWapPayRequest request = new AlipayTradeWapPayRequest();
        request.setReturnUrl(AlipayConfig.OWreturn_url);// 回跳地址
        request.setNotifyUrl(AlipayConfig.OWnotify_url);// 通知地址
        AlipayTradeWapPayModel model = new AlipayTradeWapPayModel();
        long timeStart = Calendar.getInstance().getTimeInMillis();
        model.setOutTradeNo(timeStart + "");
        model.setSubject("测试商品");
        model.setTotalAmount("0.01");
        model.setBody("测试商品");
        model.setTimeoutExpress("30m");
        model.setProductCode("QUICK_WAP_PAY");
        request.setBizModel(model);
        String form = alipayClient.pageExecute(request).getBody(); //调用SDK生成表单
        System.out.println(form);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(form);
        response.getWriter().flush();
        response.getWriter().close();

    }


    @RequestMapping(value = "/OWnotify",produces = "text/plain;charset=utf-8",method = RequestMethod.POST)
    @ResponseBody
    public void OWnotify(HttpServletRequest request, HttpServletResponse httpResponse) {
        System.out.println("---------------异步通知-------------------");
        // 获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        Set<String> keySet = requestParams.keySet();
        String out_trade_no = "";
        String trade_status = "";
        String total_amount = "";
        for (String key : keySet) {
            StringBuffer buffer = new StringBuffer();
            for (String string : requestParams.get(key)) {
                buffer.append(string);
            }
            params.put(key, buffer.toString());
            if (key.equals("out_trade_no")) {
                out_trade_no = buffer.toString();// 商户订单号
                System.out.println(key + " : " + buffer.toString());
            } else if (key.equals("trade_status")) {
                trade_status = buffer.toString();// 交易状态
                System.out.println(key + " : " + buffer.toString());
            } else if (key.equals("total_amount")) {
                total_amount = buffer.toString().substring(0, buffer.toString().length() - 3) + "";// 充值金额
                System.out.println(key + " : " + total_amount);
            }
        }
        System.out.println("支付异步回调");
        try {
            // 计算得出通知验证结果
            boolean verify_result = AlipaySignature.rsaCheckV1(params, AlipayConfig.ALIPAY_PUBLIC_KEY,
                    AlipayConfig.CHARSET, AlipayConfig.SIGNTYPE);
            if (verify_result) {// 验证成功
                if (trade_status.equals("TRADE_SUCCESS")) { // 交易支付成功
                    //逻辑
                    httpResponse.getWriter().println("success");
                }
            } else {// 验证失败
                httpResponse.getWriter().println("fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/OWreturn")
    public void OWreturn(HttpServletRequest request) {
        System.out.println("---------------同步回调-------------------");
//        ModelAndView mav = new ModelAndView();
//        System.out.println("支付同步回调");
//        mav.setViewName("/test/return");
//        return mav;

    }
}
