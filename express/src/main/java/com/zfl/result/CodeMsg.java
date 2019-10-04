package com.zfl.result;

public class CodeMsg {


    private int code;
    private String msg;
    private String data;
    //注册模块   7001xx
    public static final CodeMsg REGISTER_ERROR = new CodeMsg(700101,"注册失败");
    public static final CodeMsg INVITECODE_ERROR = new CodeMsg(700102, "邀请码错误");
    //shiro  模块6001xx
    public static final CodeMsg UNAUTHORIZED = new CodeMsg(600101,"无权访问%s");

    //请求模块 3001xx
    public static final CodeMsg REQUEST_ERROR = new CodeMsg(300101,"%s");
    public static final CodeMsg REQUEST_PARAMETERS_ERROR = new CodeMsg(300101,"请求体中没有参数");
    public static final CodeMsg CODE_REQUEST_OVER_TIME = new CodeMsg(300102, "请求超时，请确认出码客户端是否登录");

    //商品模块   4001xx
    public static final CodeMsg NO_GOOD = new CodeMsg(400101,"没有%s金额的商品");


    //密钥模块 1001xx
    public static final CodeMsg NO_SETTING_MD5KEY = new CodeMsg(100101,"%s商户没有设置key");
    public static final CodeMsg SIGN_FAILED = new CodeMsg(100102, "签名未通过");
    public static final CodeMsg TOKEN_ERROR = new CodeMsg(100103,"解密Token中的公共信息出现JWTDecodeException异常%s");

    //商户模块 2001xx
    public static final CodeMsg SERVER_NUM_STATU_NO_USABLE = new CodeMsg(200101,"商户号状态不可用");
    public static final CodeMsg SERVER_NUM_NO_CODE_NUM = new CodeMsg(200102,"商户没有供码商，请后台确认");
    public static final CodeMsg SERVER_NUM_TYPE_SUPPORT = new CodeMsg(200103,"商户类型不支持");
    public static final CodeMsg SERVER_NUM_NO_PAYTYPE = new CodeMsg(200104, "%s商户没有%s支付类型");
    public static final CodeMsg CODE_NUM_NOT_PAYTYPE = new CodeMsg(200105, "关联的供码商没有%s的支付方式");
    public static final CodeMsg PHONE_NO_USABLE = new CodeMsg(200106,"没有可用的下单手机号");
    public static final CodeMsg OUT_CODE_CLIENT = new CodeMsg(200107,"未登陆出码客户端");
    public static final CodeMsg USER_ERROR = new CodeMsg(200108,"用户%s不存在");
    //通用的错误码
    public static CodeMsg SUCCESS = new CodeMsg(0, "success");
    public static CodeMsg SERVER_ERROR = new CodeMsg(500100, "服务端异常");
    public static CodeMsg BIND_ERROR = new CodeMsg(500101, "参数校验异常：%s");

    //登录模块 5002XX
    public static CodeMsg SESSION_ERROR = new CodeMsg(500210, "Session不存在或者已经失效");
    public static CodeMsg PASSWORD_EMPTY = new CodeMsg(500211, "登录密码不能为空");
    public static CodeMsg MOBILE_EMPTY = new CodeMsg(500212, "手机号不能为空");
    public static CodeMsg MOBILE_ERROR = new CodeMsg(500213, "手机号格式错误");
    public static CodeMsg MOBILE_NOT_EXIST = new CodeMsg(500214, "手机号不存在");
    public static CodeMsg PASSWORD_ERROR = new CodeMsg(500215, "密码错误");

    //商品模块 5003XX

    //订单模块 5004XX

    //秒杀模块 5005XX

    private CodeMsg( ) {
    }

    private CodeMsg( int code,String msg ) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }
    public void setCode(int code) {
        this.code = code;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }

    public CodeMsg fillArgs(Object... args) {
        int code = this.code;
        String message = String.format(this.msg, args);
        return new CodeMsg(code, message);
    }

    @Override
    public String toString() {
        return "CodeMsg [code=" + code + ", msg=" + msg + "]";
    }


}
