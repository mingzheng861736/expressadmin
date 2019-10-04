//package com.zfl.pastorder;
//
//import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
//import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
//import com.github.pagehelper.PageInfo;
//import com.zfl.entity.TbOddNum;
//import com.zfl.entity.vo.QueryVo;
//import com.zfl.service.TbOddNumService;
//import com.zfl.util.DateUtils;
//import com.zfl.util.SpringContextUtil;
//import freemarker.template.utility.DateUtil;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.ApplicationArguments;
//import org.springframework.boot.ApplicationRunner;
//import org.springframework.scheduling.annotation.Async;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import java.text.ParseException;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
///**
// * 管理过期对象
// */
//@Component
//@Slf4j
//public class RocketMQManager implements ApplicationRunner{
//
//    //过期订单消费者
//    @Autowired
//    private Consumer consumer;
//    //过期订单生产者
//    @Autowired
//    private Producer producer;
//    @Autowired
//    private TbOddNumService oddNumService;
//
//
//    //系统启动时启动消费者
//    @Override
//    public void run(ApplicationArguments args) {
//        boolean status = false;
//        //获取消费者和生产者并启动
//        producer.startProducer();
//        consumer.startConsumer();
//    }
//
//    //定时拉取过期订单
//    @Scheduled(cron = "0/3 * * * * ?")
//    @Async
//    public void getTaskOrder(){
//        //查询条件
//        QueryVo<TbOddNum> queryVo = new QueryVo<>();
//        queryVo.setPageNo(1);
//        queryVo.setPageSize(50);
//        //查询中止时间
//        Date endTime = new Date();
//        try {
//            Date startTime = DateUtils.dateAdd(endTime, -1, true);
//            //设置当前为止过去一天的订单
//            queryVo.setStartTime(DateUtils.dateFormat(startTime, DateUtils.DATE_TIME_PATTERN));
//            queryVo.setEndTime(DateUtils.dateFormat(endTime,DateUtils.DATE_TIME_PATTERN));
//        } catch (ParseException e) {
//
//        }
//        //查询条件实体类
//        queryVo.setData(new TbOddNum());
//        //未支付状态
//        queryVo.getData().setOrderState(0);
//        //获取第一页五十条订单信息
//        List<TbOddNum> pastOrderList = oddNumService.getOrderByCondition(queryVo);
//        PageInfo<TbOddNum> pastOrderPage = new PageInfo<>(pastOrderList);
//        //过期订单id
//        ArrayList<Integer> pastOrderIds = new ArrayList<>();
//        //遍历所有过期订单页码
//        while(true){
//            if(pastOrderList == null || pastOrderList.size() < 1){
//                break;
//            }
//            //添加所有过期订单id
//            pastOrderList.forEach(e -> pastOrderIds.add(e.getId()));
//            //设置更改条件
//            UpdateWrapper<TbOddNum> updateWrapper = new UpdateWrapper<TbOddNum>();
//            updateWrapper.in("id",pastOrderIds);
//            TbOddNum updateOddNum = new TbOddNum();
//            updateOddNum.setOrderState(-1);
//            oddNumService.update(updateOddNum,updateWrapper);
//            //如果数据没有查询完毕,查询下一页并重新循环
//            if(pastOrderPage.getPageNum() <= pastOrderPage.getPageSize()){
//                //查询下一页
//                queryVo.setPageNo(pastOrderPage.getPageNum() + 1);
//                pastOrderList = oddNumService.getOrderByCondition(queryVo);
//                pastOrderPage = new PageInfo<>(pastOrderList);
//            }
//        }
//
//    }
//
//
//}
