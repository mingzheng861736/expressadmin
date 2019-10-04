package com.example.demo.shouji;


import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;

public class AlipayConfig {
    //网关地址
    public static final String URL = "https://openapi.alipay.com/gateway.do"; //(正式环境)
   // public static final String URL = "https://openapi.alipaydev.com/gateway.do"; //沙箱(测试环境)

//    //APPID
//    public static final String ALIPAY_APPID = "2016101300677461";
//
//    //私钥
//    public static String APP_PRIVATE_KEY ="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";
//
//    //支付宝公钥
//    public static String ALIPAY_PUBLIC_KEY ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlt0/SiR/i4hV0RT+OHYm70U2IJYgO1G74FNAUChoJvWII09Wo74RuDCOe2355vzISzpt7KxzxSkVfVtfbYz2OiRIYKwgJ9JL8VsYQsi+DejB8ByKfLKprVH7bXW7TJjEvcOyzahcfw/6Q1OUl4H1+R9TDeIXMIjmWaYP2lnIW/pc5aCnY6DY6l6J0tHTKJi08Wu+UHfiw2I9pl/pzEJa2UGKXOiBYrz1xH0SssORLuST7miay544s1/WofzTQZgNr78zaWV5kBMGrEO/5/ruC4/Y6AxInkYPU/kbkKgznol4LLZ+DpgYukQOgbk31FyirM/VBotI9pVR+RsHER8oMwIDAQAB/3dVvnAMofSu92Fc/CZu41FOImfQRatpYbhGmUdFgKzSiTARnH0lrzpXgeeOFI0pGoeyc4hYzIu1XHX8hm+jC027/2+DzASHrJIvyFFzPQF8CZh9528SFRp0LFKm6Uk5zupZJVekPBY7hE3qLO9kS0F9zQYEQjceYKn1IXZo8vD9FZMS2ulEZiruiwWZWaXmgtV5ng2qd2zrbCvfFtivHvYlwqYaykalt4BHovb+aXnC6a53Ap+NnD8NR0d0JqeurW6NKYA9hCKCtrYo68cns4lgw/aqap/wbUb6QXnWbsZCqrzbynoiFouo8lFcoz7PwIDAQAB";

    //APPID
    public static final String ALIPAY_APPID = "2019071965938004";

    //私钥
    public static String APP_PRIVATE_KEY ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCFUoRAPFXD6fYMm6k9IOQij59b84bMOPVRAx+dBsQF98lR4liTo4++ITj/GGu3VG9KyVEvZKPde/NTKuHmCeB0ZlkHyN7c200+D1rdTE4PoeYjZ0WqHSW9EOGqq7HDuuBKph/oZjTcPaHo2DlCRNaZYJY2PuPCqhMxiAx4CvBa4HkoWMKuuG1f6uWNpOFkaNs9FaProLVIBRsOwltozJ20DC6WldKjeYehGAiz8ldApHZpp4E6Z4usz2TwXVsj1ju+5IlCRiYzqV8v7A9oifM36EtG+4OTLEQWzVuFOpv7qr80zRa3F9UquKIjj3LE/MnN/ZUMnsy08fBZKXWXAKfBAgMBAAECggEABrefnjTsBVD2arA1GLVdiTg/STy93/BGu+wyXZEHs11GsW98EwQ8q9G0s3Whh70jVltKUd76OqCSI/CXLSX2Pycg+TlvsSUDgUr4wwmjLTp1A/eiFO4fBqWhGR5JeJkjz98K4IS1yRr522d5ixM41MV/DACjLR2wleBK8IlsjseJW5Ltu/5XnSZZ0K9APi6G9QIGtKpXLM3qoVM8/oM7AOEM8phL4cVgts9pW80esTwKDzEt8BslkBfcMkox3thGZMbn0j4T73QcixCl8yt92ElNebqERRhoojF3709vRy74hQtZkoaa3Ey//gMsGnUb9b0rlOZBlJ7KXesOBOa+mQKBgQDuBOMVjiWUkFdt1M3vlStDPBP7qV8Zf7mBIHszg4uEwTuOHdWZdiobwbXvrMfcgqyHBeg6f0L4FdoGwKj1MT/O4YKP6AOj1v+SOIF1eSFSOFdyOoItP80FjKzEEqEuvtexQZtGwFomV7Zg9yzjByI8bohs0WndT+7yr1nSdx7lTwKBgQCPZN8rRcgP5UluLukrYT6+9ZxtSIhTvzekiJIGHL9aEG0/lpSdfnZ1UQfXWDlTo9yzIcBt3GVqjvCxmH5FTg9t3l4NHGZQUJCue+XyzBlQ2cxA23n1Innvad4P3fKxuaBfqgR83NUk6G/bjTSnzeK86Ofz0QFDhdro1Kbcp3997wKBgQDOgXb0EKwSRVlVdThnESjD4LAFvGFCIkqz+ZZqj0rRF0Wwe7oCtz65bkuHcoTEkKtXSoy9lARqcasECMuOT/hoacd5S3c9AyAhoNzRKxL53uAfvxuKXrxmgDK0uuUVRYalx6IMtH6Cnb8iSdGr91iAzfWXU+lhliRecjygGbG4iQKBgC+gyZ+N5g2hkupOGpSWEElNO0/xL5bhhJHZ6uas1cIMgr0EPwiw4JfG+lvEqgXl/4BgTZIwCl+CauASTp6mdul/Wq3wKOu0VtodvRsQP7hjHzzLqY6KjQXAnEmY5uuxRFuCFUuD7if8LGs4U60I7a7hjWmmmkzbQQLk3yebWvVxAoGAAwN/OXb0amsf9vlKw0DU1JwZvPte9UveUB/SGGicQO8UYZ1Ujz6OBNotOcnxwxoC65bD/77bm6rYfC+BtPWde5s5oiPy6GZPvyOhnHMrocO794uhdLqjttVkVMXp5B7kkAQXnKw9FBRSXs7oSdXjCwtfac8SZpVInbYkv8YKuCY=";

    //支付宝公钥
    public static String ALIPAY_PUBLIC_KEY ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhNmkCxKvpbBxvHwWFcTCV/3dVvnAMofSu92Fc/CZu41FOImfQRatpYbhGmUdFgKzSiTARnH0lrzpXgeeOFI0pGoeyc4hYzIu1XHX8hm+jC027/2+DzASHrJIvyFFzPQF8CZh9528SFRp0LFKm6Uk5zupZJVekPBY7hE3qLO9kS0F9zQYEQjceYKn1IXZo8vD9FZMS2ulEZiruiwWZWaXmgtV5ng2qd2zrbCvfFtivHvYlwqYaykalt4BHovb+aXnC6a53Ap+NnD8NR0d0JqeurW6NKYA9hCKCtrYo68cns4lgw/aqap/wbUb6QXnWbsZCqrzbynoiFouo8lFcoz7PwIDAQAB";


    //签名算法类型(根据生成私钥的算法,RSA2或RSA)
    public static final String SIGNTYPE = "RSA2";

    public static final String FORMAT = "json";//请求数据格式
    public static final String CHARSET = "utf-8";//编码集

    // 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static final String OWnotify_url = "http://v2699117x2.wicp.vip/OWnotify";//网站扫码
    // 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static final String OWreturn_url = "http://v2699117x2.wicp.vip/OWreturn";//网站扫码

    // 统一收单交易创建接口
    private static AlipayClient alipayClient = null;

    /**
     * 获得初始化的AlipayClient
     *
     * @return 支付宝客户端
     */
    public static AlipayClient getAlipayClient() {
        if (alipayClient == null) {
            synchronized (AlipayConfig.class) {
                if (null == alipayClient) {
                    alipayClient = new DefaultAlipayClient(URL, ALIPAY_APPID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGNTYPE);
                }
            }
        }
        return alipayClient;
    }
}