package com.zfl.service.expressageService;

import com.alibaba.fastjson.JSONObject;
import com.zfl.result.Result;
import org.springframework.stereotype.Service;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * <p>
 *  快递查询 服务类
 * </p>
 *
 * @author szp
 * @since 2019-08-28
 */
@Service
public class ExpressageService {

   /* public Map<String, Object> findExpressageInfo(String cohr, String ExpressNumber) {
        Map<String,Object> map = new HashMap<>();
        KdniaoTrackQueryAPI api = new KdniaoTrackQueryAPI();
        try {
            //第一个参数是快递公司简称（YD -- 韵达速递）
            //第二个参数是需要查询的快递单号
            String result = api.getOrderTracesByJson(cohr, ExpressNumber);
            JSONObject jsonObject = JSONObject.fromObject(result);
            if(jsonObject.containsKey("ShipperCode")){
                String ShipperCode = jsonObject.getString("ShipperCode");//快递公司编码
                String LogisticCode = jsonObject.getString("LogisticCode");//快递单号
                JSONArray Traces = jsonObject.getJSONArray("Traces");//物流轨迹

                System.out.print(result+"\n");
                System.out.println("快递名称"+ShipperCode);
                System.out.println("快递单号"+LogisticCode);
                int count = 1;
                for(int i = 0; Traces.size() > i; i++) {
                    JSONObject object = (JSONObject) Traces.get(i);
                    String AcceptTime = object.getString("AcceptTime");//时间
                    String AcceptStation = object.getString("AcceptStation");//时间对应的物流信息
                    System.out.println("时间："+AcceptTime+"\t"+AcceptStation);
                    map.put("时间"+count,AcceptTime+AcceptStation);
                    count++;
                }}
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("结束");
        }
        return map;
    }*/
   /**
    *功能描述
    * @author sunzhenpeng
    * @date 2019/8/29
    * @return java.util.Map<java.lang.String,java.lang.Object>
    */
    public Map<String, Object> findExpressageInfo(String expressNumber) {
        Map<String,Object> resultMap = new HashMap<>();
        SendGetUtil sgu = new SendGetUtil();
        try {
            String result = sgu.get(expressNumber);
            Map<String,Object> json =  (Map<String,Object>)JSONObject.parseObject(result);

            //List<JSONObject> context =  (List<JSONObject>)((Map<String,Object>)json.get("data")).get("context");
            List<JSONObject> context =  (List<JSONObject>)(((Map<String,Object>)(((Map<String,Object>)json.get("data")).get("info"))).get("context"));
            if(context==null){
                return null;
            }

            for(JSONObject jso :context){
                Map<String,Object> ma = jso;
                ma.put("desc",sgu.unicodeToString((String)ma.get("desc")));
                //将时间戳转换为"yyyy-MM-dd HH:mm:ss"
                String time = (String) ma.get("time");
                Long s = new Long(Integer.parseInt(time));
                ma.put("time",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(s * 1000)));
            }
            //System.out.println(json);
            Map<String,Object> expressInfo = (Map<String,Object>)(((Map<String,Object>)json.get("data")).get("info"));
            expressInfo.put("expressNumber",expressNumber);
            resultMap.put("info",expressInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
}
