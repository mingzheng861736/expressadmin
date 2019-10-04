//package com.zfl.pastorder;
//
//import org.apache.rocketmq.client.producer.LocalTransactionState;
//import org.apache.rocketmq.client.producer.TransactionListener;
//import org.apache.rocketmq.common.message.Message;
//import org.apache.rocketmq.common.message.MessageExt;
//
//import java.util.concurrent.ConcurrentHashMap;
//
///**
// * @Auther: wbh
// * @Date: 2019/9/5 15:39
// * @Description:
// */
//public class TransactionListenerImpl  implements TransactionListener {
//
//    //存储对应事务状态信息 key:事务ID,value:当前事务执行的状态
//    private ConcurrentHashMap<String,Integer> localTrans = new ConcurrentHashMap<>();
//
//    @Override
//    public LocalTransactionState executeLocalTransaction(Message msg, Object arg) {
//        String tId = msg.getTransactionId();
//        localTrans.put(tId,1);
//        return LocalTransactionState.COMMIT_MESSAGE;
//    }
//
//    @Override
//    public LocalTransactionState checkLocalTransaction(MessageExt msg) {
//        String transactionId = msg.getTransactionId();
//        //获取对应事务id所执行状态
//        Integer status = localTrans.get(transactionId);
//        switch (status){
//            case 1:
//                return LocalTransactionState.COMMIT_MESSAGE;
//            case 2:
//                return LocalTransactionState.ROLLBACK_MESSAGE;
//            default:
//                return LocalTransactionState.UNKNOW;
//        }
//    }
//}
