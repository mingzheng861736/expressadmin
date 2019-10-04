package com.zfl.service.payservice;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.alipay.api.response.AlipayTradeWapPayResponse;
import com.zfl.entity.receivingappentity.AliPayRespones;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author susan
 * @create 2019 - 07 - 20
 **/
@Service
public class AliPayService {

    @Autowired
    private HttpServletRequest request;

    /**
    * @Description: 请求支付宝生成订单
    * @Param: [goods_name, amount, outTradeNo]
    * @return: com.zfl.entity.receivingappentity.AliPayRespones
    * @Author: zc
    * @Date: 2019/8/29 14:55
    */
    public AliPayRespones getPreOrder(String goods_name, double amount, String outTradeNo){
        AliPayRespones aliPayRespones = new AliPayRespones();
        AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.SIGNTYPE);
        AlipayTradeWapPayRequest alipay_request=new AlipayTradeWapPayRequest();
        // 设置异步通知地址
        alipay_request.setNotifyUrl(AlipayConfig.notify_url);
        // 设置同步地址
        alipay_request.setReturnUrl(AlipayConfig.return_url);
        // 封装请求支付信息
        AlipayTradeWapPayModel model=new AlipayTradeWapPayModel();
        model.setOutTradeNo(outTradeNo);
        model.setSubject(goods_name);
        model.setTotalAmount(amount+"");
        model.setBody(goods_name);
        model.setTimeoutExpress("2m");
        model.setProductCode("QUICK_WAP_WAY");
        alipay_request.setBizModel(model);

        // form表单生产
        String form = "";
        try {
            // 调用SDK生成表单
            form = client.pageExecute(alipay_request).getBody();
            aliPayRespones.setPayUrl(form);
        } catch (AlipayApiException e) {
            e.getMessage();
        }
        return aliPayRespones;
    }

    //获取当前项目连接
    private String getUrl(){
        StringBuffer url = request.getRequestURL();
        String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append(request.getServletContext().getContextPath()).append("/").toString();
        System.out.println("当前项目url:"+tempContextUrl);
        return tempContextUrl;
    }
}
