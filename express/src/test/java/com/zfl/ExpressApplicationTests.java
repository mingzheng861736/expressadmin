package com.zfl;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.zfl.entity.AdminUser;
import com.zfl.entity.TbArea;
import com.zfl.service.AdminUserService;
import com.zfl.service.TbAreaService;
import com.zfl.service.expressageService.SendGetUtil;
import com.zfl.util.RequestUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpEntity;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ExpressApplicationTests {
    @Test
    public void contextLoads() {
        OkHttpClient client = new OkHttpClient();

        Request request = new Request.Builder()
                .url("http://sp0.baidu.com/9_Q4sjW91Qh3otqbppnN2DJv/pae/channel/data/asyncqury?cb=?&appid=4001&nu=YT9017407255605&com=_auto&qid=8081865297566106428&source_xcx=0&vcode=&token=&sourceId=4155")
                .get()
                .addHeader("cache-control", "no-cache")
                //.addHeader("Postman-Token", "8c22f6b4-7f50-43f1-8a4a-6c04814299bb")
                .build();
        try {
            Response response = client.newCall(request).execute();
            String json = response.body().string();
            System.out.println(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void expressTest(){

    }
    @Test
    public void test1() {
        try {
            URL url = new URL("http://sp0.baidu.com/9_Q4sjW91Qh3otqbppnN2DJv/pae/channel/data/asyncqury?cb=?&appid=4001&nu=YT9017407255605&com=_auto&qid=8081865297566106428&source_xcx=0&vcode&token&sourceId=4155");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setDoOutput(true); // 设置该连接是可以输出的
            connection.setRequestMethod("GET"); // 设置请求方式
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            String line = null;
            StringBuilder result = new StringBuilder();
            while ((line = br.readLine()) != null) { // 读取数据
                result.append(line + "\n");
            }
            connection.disconnect();
            String res=result.toString();
            System.out.println(res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void unicodeToString (){

        String code = "\\u3010\\u6cb3\\u5357\\u7701\\u5357\\u9633\\u5e02\\u3011 \\u5df2\\u53d1\\u51fa \\u4e0b\\u4e00\\u7ad9 \\u3010\\u6cb3\\u5357\\u7701\\u5357\\u9633\\u5e02\\u9e92\\u9e9f\\u8def\\u516c\\u53f8\\u3011";
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
    }


//    @Test
//    public void test()throws Exception{
//        OkHttpClient client = new OkHttpClient();
//
//        Request request = new Request.Builder()
//                .url("http://sp0.baidu.com/9_Q4sjW91Qh3otqbppnN2DJv/pae/channel/data/asyncqury?cb=?&appid=4001&nu=YT9017407255605&com=_auto&qid=8081865297566106428&source_xcx=0&vcode=&token=&sourceId=4155")
//                .get()
//                //.addHeader("User-Agent", "PostmanRuntime/7.15.2")
//                .addHeader("Accept", "*/*")
//                .addHeader("Cache-Control", "no-cache")
//                //.addHeader("Postman-Token", "4887bc39-fece-4f38-9620-ddd87342bcf1,2b6f9581-77fd-41a2-8d73-6adcb376d3c2")
//                .addHeader("Host", "sp0.baidu.com")
//                .addHeader("Cookie", "BAIDUID=36CFC0563623C9BC95AA5197D4874DA5:FG=1")
//                .addHeader("Accept-Encoding", "gzip, deflate")
//                .addHeader("Connection", "keep-alive")
//                .addHeader("cache-control", "no-cache")
//                .build();
//
//        Response response = client.newCall(request).execute();
//        String json = response.body().string();
//        JSONObject resObj=JSONObject.parseObject(json);
//        System.out.println(json);
//    }
    @Autowired
   AdminUserService adminUserService;

    @Autowired
    TbAreaService areaService;

    @Test
    public void  test004() throws Exception{

        AdminUser adminUser = new AdminUser();
        adminUser.setId(21);
        boolean a=adminUserService.updateById(adminUser);
        System.out.println(a);

    }
    @Test
    public void  test005() throws Exception{

        TbArea area = new TbArea();
        area.setId(4);
        area.setAreaName("sdf");
        area.setAreaDividePerson("sfsddf");

                boolean a =areaService.updateById(area);

        System.out.println("================================"+a);

    }


}
