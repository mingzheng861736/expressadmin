package com.example.demo.controller;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
public class payController {
    @RequestMapping("pay")
    public void getPreOrder(HttpServletResponse response) {
        String sysOrderNum = UUID.randomUUID().toString().replace("-", "").trim().substring(2, 6);
        AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID,
                AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT,
                AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);
        AlipayTradeWapPayRequest alipay_request = new AlipayTradeWapPayRequest();
        // 封装请求支付信息
        AlipayTradeWapPayModel model = new AlipayTradeWapPayModel();
        model.setOutTradeNo(sysOrderNum);
        model.setSubject("物品信息");
        model.setTotalAmount(100 + "");
        model.setBody("物品信息");
        model.setTimeoutExpress("2m");
        model.setProductCode("QUICK_WAP_WAY");
        alipay_request.setBizModel(model);
        // 设置异步通知地址
        alipay_request.setNotifyUrl(AlipayConfig.notify_url);
        // 设置同步地址
        alipay_request.setReturnUrl(AlipayConfig.return_url);
        // form表单生产
        String form = "";
        try {
            // 调用SDK生成表单
            form = client.pageExecute(alipay_request).getBody();
            System.out.println("=============================" + form);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(form);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (Exception e) {
        }
    }

    @RequestMapping(value = "notify", method = RequestMethod.POST)
    public void trackPaymentStatus(HttpServletRequest request, HttpServletResponse response) {
            System.out.println("--------------------------------notify------------------------------");
        try {
            Map<String, String> params = new HashMap<String, String>();
            Map requestParams = request.getParameterMap();
            for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
                String name = (String) iter.next();
                String[] values = (String[]) requestParams.get(name);
                String valueStr = "";
                for (int i = 0; i < values.length; i++) {
                    valueStr = (i == values.length - 1) ? valueStr + values[i]
                            : valueStr + values[i] + ",";
                }
                params.put(name, valueStr);
            }
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");             //支付宝交易号
            //商户订单号
            String order_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");         //获取订单号
            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
            //计算得出通知验证结果
            boolean verify_result = AlipaySignature.rsaCheckV1(params, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.CHARSET, "RSA2");
            if (verify_result) {//验证成功
                //即时到账普通版
                if (trade_status.equals("TRADE_FINISHED")) {

                    //即时到账高级版
                } else if (trade_status.equals("TRADE_SUCCESS")) {


                    response.getWriter().println("success");
                } else {
                    //验证失败

                    response.getWriter().println("fail");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "return", method = RequestMethod.GET)
    public String callback(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("--------------------------------return------------------------------");
        try {
            Map<String, String> params = new HashMap<String, String>();
            Map requestParams = request.getParameterMap();
            for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
                String name = (String) iter.next();
                String[] values = (String[]) requestParams.get(name);
                String valueStr = "";
                for (int i = 0; i < values.length; i++) {
                    valueStr = (i == values.length - 1) ? valueStr + values[i]
                            : valueStr + values[i] + ",";
                }
                //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
                //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
                params.put(name, valueStr);
            }
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");             //支付宝交易号
            //商户订单号
            String order_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");         //获取订单号
            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
            boolean verify_result = AlipaySignature.rsaCheckV1(params, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.CHARSET, "RSA2");
            if (verify_result) {
                return "test/notify_url";
            } else {
                return "test/return";
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        } catch (AlipayApiException e) {
            e.printStackTrace();
            return null;
        }
    }
}

