package com.zfl.service.payservice;

public class AlipayConfig {
	// 商户appid
	public static String APPID = "2019071965938004";
	// 私钥 pkcs8格式的
	public static String RSA_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCFUoRAPFXD6fYMm6k9IOQij59b84bMOPVRAx+dBsQF98lR4liTo4++ITj/GGu3VG9KyVEvZKPde/NTKuHmCeB0ZlkHyN7c200+D1rdTE4PoeYjZ0WqHSW9EOGqq7HDuuBKph/oZjTcPaHo2DlCRNaZYJY2PuPCqhMxiAx4CvBa4HkoWMKuuG1f6uWNpOFkaNs9FaProLVIBRsOwltozJ20DC6WldKjeYehGAiz8ldApHZpp4E6Z4usz2TwXVsj1ju+5IlCRiYzqV8v7A9oifM36EtG+4OTLEQWzVuFOpv7qr80zRa3F9UquKIjj3LE/MnN/ZUMnsy08fBZKXWXAKfBAgMBAAECggEABrefnjTsBVD2arA1GLVdiTg/STy93/BGu+wyXZEHs11GsW98EwQ8q9G0s3Whh70jVltKUd76OqCSI/CXLSX2Pycg+TlvsSUDgUr4wwmjLTp1A/eiFO4fBqWhGR5JeJkjz98K4IS1yRr522d5ixM41MV/DACjLR2wleBK8IlsjseJW5Ltu/5XnSZZ0K9APi6G9QIGtKpXLM3qoVM8/oM7AOEM8phL4cVgts9pW80esTwKDzEt8BslkBfcMkox3thGZMbn0j4T73QcixCl8yt92ElNebqERRhoojF3709vRy74hQtZkoaa3Ey//gMsGnUb9b0rlOZBlJ7KXesOBOa+mQKBgQDuBOMVjiWUkFdt1M3vlStDPBP7qV8Zf7mBIHszg4uEwTuOHdWZdiobwbXvrMfcgqyHBeg6f0L4FdoGwKj1MT/O4YKP6AOj1v+SOIF1eSFSOFdyOoItP80FjKzEEqEuvtexQZtGwFomV7Zg9yzjByI8bohs0WndT+7yr1nSdx7lTwKBgQCPZN8rRcgP5UluLukrYT6+9ZxtSIhTvzekiJIGHL9aEG0/lpSdfnZ1UQfXWDlTo9yzIcBt3GVqjvCxmH5FTg9t3l4NHGZQUJCue+XyzBlQ2cxA23n1Innvad4P3fKxuaBfqgR83NUk6G/bjTSnzeK86Ofz0QFDhdro1Kbcp3997wKBgQDOgXb0EKwSRVlVdThnESjD4LAFvGFCIkqz+ZZqj0rRF0Wwe7oCtz65bkuHcoTEkKtXSoy9lARqcasECMuOT/hoacd5S3c9AyAhoNzRKxL53uAfvxuKXrxmgDK0uuUVRYalx6IMtH6Cnb8iSdGr91iAzfWXU+lhliRecjygGbG4iQKBgC+gyZ+N5g2hkupOGpSWEElNO0/xL5bhhJHZ6uas1cIMgr0EPwiw4JfG+lvEqgXl/4BgTZIwCl+CauASTp6mdul/Wq3wKOu0VtodvRsQP7hjHzzLqY6KjQXAnEmY5uuxRFuCFUuD7if8LGs4U60I7a7hjWmmmkzbQQLk3yebWvVxAoGAAwN/OXb0amsf9vlKw0DU1JwZvPte9UveUB/SGGicQO8UYZ1Ujz6OBNotOcnxwxoC65bD/77bm6rYfC+BtPWde5s5oiPy6GZPvyOhnHMrocO794uhdLqjttVkVMXp5B7kkAQXnKw9FBRSXs7oSdXjCwtfac8SZpVInbYkv8YKuCY=";
	// 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//public static String notify_url = "http://edu.zfllpay.cn:21000/school/pay/callback";
	public static String notify_url = "http://v2699117x2.wicp.vip/pay/callback";
	//http://258gs67595.wicp.vip:40691
	// 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
	public static String return_url = "http://v2699117x2.wicp.vip/pay/callback";
	// 请求网关地址
	public static String URL = "https://openapi.alipay.com/gateway.do";
	// 编码
	public static String CHARSET = "UTF-8";
	// 返回格式
	public static String FORMAT = "json";
	// 支付宝公钥
	public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhNmkCxKvpbBxvHwWFcTCV/3dVvnAMofSu92Fc/CZu41FOImfQRatpYbhGmUdFgKzSiTARnH0lrzpXgeeOFI0pGoeyc4hYzIu1XHX8hm+jC027/2+DzASHrJIvyFFzPQF8CZh9528SFRp0LFKm6Uk5zupZJVekPBY7hE3qLO9kS0F9zQYEQjceYKn1IXZo8vD9FZMS2ulEZiruiwWZWaXmgtV5ng2qd2zrbCvfFtivHvYlwqYaykalt4BHovb+aXnC6a53Ap+NnD8NR0d0JqeurW6NKYA9hCKCtrYo68cns4lgw/aqap/wbUb6QXnWbsZCqrzbynoiFouo8lFcoz7PwIDAQAB";
	// 日志记录目录
	public static String log_path = "/log";
	// RSA2
	public static String SIGNTYPE = "RSA2";
}

