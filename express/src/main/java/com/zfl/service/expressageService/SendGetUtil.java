package com.zfl.service.expressageService;

import com.alibaba.fastjson.JSONObject;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author sunzhenpeng
 * @data 2019/8/29
 * @description 发送get请求
 */
public class SendGetUtil {
    /**
     *功能描述
     * @author sunzhenpeng
     * @date 2019/8/29
     * @param ExpressNumber
     * @return void
     */
    public String get(String ExpressNumber ) throws Exception{
        OkHttpClient client = new OkHttpClient();

        Request request = new Request.Builder()
                .url("http://sp0.baidu.com/9_Q4sjW91Qh3otqbppnN2DJv/pae/channel/data/asyncqury?cb=?&appid=4001&nu="+ExpressNumber+"&com=_auto&qid=8081865297566106428&source_xcx=0&vcode=&token=&sourceId=4155")
                .get()
                //.addHeader("User-Agent", "PostmanRuntime/7.15.2")
                .addHeader("Accept", "*/*")
                .addHeader("Cache-Control", "no-cache")
                //.addHeader("Postman-Token", "4887bc39-fece-4f38-9620-ddd87342bcf1,2b6f9581-77fd-41a2-8d73-6adcb376d3c2")
                .addHeader("Host", "sp0.baidu.com")
                .addHeader("Cookie", "BAIDUID=36CFC0563623C9BC95AA5197D4874DA5:FG=1")
                .addHeader("Accept-Encoding", "gzip, deflate")
                .addHeader("Connection", "keep-alive")
                .addHeader("cache-control", "no-cache")
                .build();

        Response response = client.newCall(request).execute();
        String json = response.body().string();
        JSONObject resObj=JSONObject.parseObject(json);
        //System.out.println(json);
        return json;
    }
    /**
     *功能描述
     * @author sunzhenpeng
     * @date 2019/8/29
     * @param code
     * @return java.lang.String
     */
    public String unicodeToString (String code){
        Pattern pattern = Pattern.compile("(\\\\u(\\p{XDigit}{4}))");
        Matcher matcher = pattern.matcher(code);
        char ch;
        while (matcher.find()) {
            //group 6728
            String group = matcher.group(2);
            //ch:'木' 26408
            ch = (char) Integer.parseInt(group, 16);
            //group1 \u6728
            String group1 = matcher.group(1);
            code = code.replace(group1, ch + "");
        }
        System.out.println(code);
        return code;
    }
}
