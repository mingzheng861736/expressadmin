package com.zfl.util;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;


public class NoteUtil {
    static final String accessKeyId = "LTAIbTADFUeYJWjc";
    static final String accessKeySecret = "OtciwvNPwoPOsDs4mCyfHvUxwDUGYw";

    /**
     * 验证码
     * @param tel 手机号
     * @param code 验证码
     * @return
     */
    public static String verify(String tel,String code){
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        IAcsClient client = new DefaultAcsClient(profile);
        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", tel);
        request.putQueryParameter("SignName", "聚单快递");
        request.putQueryParameter("TemplateCode", "SMS_173665902");
        request.putQueryParameter("TemplateParam", code);
        try {
            CommonResponse response = client.getCommonResponse(request);
            return response.getData();
        }  catch (ClientException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 通知短信
     * @param PhoneNumbers 发送的手机号
     * @param tel  短信内容里的 用户手机号
     * @param address 短信内容里的 用户地址
     * @param userName 短信内容里的 用户姓名
     * @return
     */
    public static String informing(String PhoneNumbers,String tel,String address,String userName){
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        IAcsClient client = new DefaultAcsClient(profile);
        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", PhoneNumbers);
        request.putQueryParameter("SignName", "三人行商务");
        request.putQueryParameter("TemplateCode", "SMS_174026814");
        String params ="{tel:'"+tel+"',address:'"+address+"',userName:'"+userName+"'}";
        request.putQueryParameter("TemplateParam",params);
        try {
            CommonResponse response = client.getCommonResponse(request);
            return response.getData();
        }  catch (ClientException e) {
            e.printStackTrace();
            return null;
        }
    }
}
