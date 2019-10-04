//package com.zfl.pastorder;
//
//import lombok.extern.slf4j.Slf4j;
//import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;
//
///**
// * 订单消费者
// */
//@Slf4j
//@Component
//public class Consumer {
//
//    //设置订单过期消费者对象
//    private DefaultMQPushConsumer consumer;
//    @Value("${rocketmq.orderPast.consumerGroup}")
//    private String orderConsumerGroup;
//    @Value("${rocketmq.namesrvAddr}")
//    private String namesrvAddr;
//    @Value("${rocketmq.orderPast.topic}")
//    private String orderPastTopic;
//    @Value("${rocketmq.orderPast.tags}")
//    private String orderPastTags;
//
//    //启动过期订单消费者,true启动成功,false启动失败
//    public boolean startConsumer() {
//        try {
//            //实例化消费者
//            consumer = new DefaultMQPushConsumer(orderConsumerGroup);
//            //设置RocketMQ地址
//            consumer.setNamesrvAddr(namesrvAddr);
//            //设置过滤信息
//            consumer.subscribe(orderPastTopic, orderPastTags);
//            consumer.setMessageListener(new ConsumerListener());
//            consumer.start();
//            log.info("过期订单消费者启动成功");
//        } catch (Exception e) {
//            e.printStackTrace();
//            //清空之前对消费者的所有操作
//            consumer = null;
//            return false;
//        }
//        return true;
//    }
//
//    public boolean shutdownConsumer() {
//        consumer.shutdown();
//        return true;
//    }
//
//
//    public void showParam() {
//        System.out.println("orderConsumerGroup = " + orderConsumerGroup);
//        System.out.println("namesrvAddr = " + namesrvAddr);
//        System.out.println("topic = " + orderPastTopic);
//        System.out.println("tags = " + orderPastTags);
//    }
//
//
//}
//

