//package com.zfl.pastorder;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.zfl.service.TbOddNumService;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
//import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
//import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
//import org.apache.rocketmq.common.message.MessageExt;
//import org.apache.rocketmq.remoting.common.RemotingHelper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;
//
//import java.io.UnsupportedEncodingException;
//import java.util.List;
//
///**
// * 监听过期订单消息并处理
// */
//@Component
//@Slf4j
//public class ConsumerListener implements MessageListenerConcurrently {
//
//    @Autowired
//    private TbOddNumService oddNumService;
//    @Value("${rocketmq.orderPast.topic}")
//    private String orderPastTopic;
//    @Value("${rocketmq.orderPast.tags}")
//    private String orderPastTags;
//
//    @Override
//    public ConsumeConcurrentlyStatus consumeMessage(List<MessageExt> msgs, ConsumeConcurrentlyContext context) {
//        //迭代消息信息
//        for (MessageExt msg : msgs) {
//            try {
//                //获取消息主体
//                String msgTopic = msg.getTopic();
//                //获取消费标签
//                String msgTags = msg.getTags();
//                //判断消费信息是否正确
//                if(orderPastTopic.equals(msgTopic) && orderPastTags.equals(msgTags)){
//                    //获取消费信息主体
//                    String bodyStr = new String(msg.getBody(), RemotingHelper.DEFAULT_CHARSET);
//                    JSONObject bodyJson = JSON.parseObject(bodyStr);
//                    //获取订单号
//                    Integer oid = Integer.valueOf(bodyJson.get("oid").toString());
//
//                }
//            } catch (UnsupportedEncodingException e) {
//                return ConsumeConcurrentlyStatus.RECONSUME_LATER;
//            }
//        }
//
//        return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
//    }
//}