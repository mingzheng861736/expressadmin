//package com.zfl.pastorder;
//
//import lombok.extern.slf4j.Slf4j;
//import org.apache.rocketmq.client.producer.TransactionMQProducer;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;
//
//import java.util.concurrent.ArrayBlockingQueue;
//import java.util.concurrent.ThreadFactory;
//import java.util.concurrent.ThreadPoolExecutor;
//import java.util.concurrent.TimeUnit;
//
///**
// * @Auther: wbh
// * @Date: 2019/9/5 11:51
// * @Description:
// */
//@Slf4j
//@Component
//public class Producer {
//
//    //负责发送过期订单信息的消费者
//    private TransactionMQProducer producer;
//    @Value("${rocketmq.orderPast.producerGroup}")
//    private String orderProducerGroup;
//    @Value("${rocketmq.namesrvAddr}")
//    private String namesrvAddr;
//    @Value("${rocketmq.orderPast.topic}")
//    private String orderPastTopic;
//    @Value("${rocketmq.orderPast.tags}")
//    private String orderPastTags;
//
//    public void showParam(){
//        System.out.println("orderProducerGroup = " + orderProducerGroup);
//        System.out.println("namesrvAddr = " + namesrvAddr);
//        System.out.println("orderPastTopic = " + orderPastTopic);
//        System.out.println("orderPastTags = " + orderPastTags);
//    }
//
//    public boolean startProducer() {
//        try {
//            producer = new TransactionMQProducer(orderProducerGroup);
//            producer.setNamesrvAddr(namesrvAddr);
//            //设置事务监听
//            TransactionListenerImpl transactionListener = new TransactionListenerImpl();
//            producer.setTransactionListener(transactionListener);
//            //线程池
//            ThreadPoolExecutor pool = new ThreadPoolExecutor(4, 5, 100, TimeUnit.SECONDS,
//                    new ArrayBlockingQueue<Runnable>(2000), new ThreadFactory() {
//                @Override
//                public Thread newThread(Runnable r) {
//                    Thread thread = new Thread(r);
//                    thread.setName("client-transaction-msg-check-thread");
//                    return thread;
//                }
//            }
//            );
//            //设置线程池
//            producer.setExecutorService(pool);
//            producer.start();
//           // log.info("过期订单消息生产者启动成功");
//        } catch (Exception e) {
//            producer = null;
//            return  false;
//        }
//
//        return true;
//    }
//
//    public void shutdownProducer(){
//        producer.shutdown();
//    }
//
//}
