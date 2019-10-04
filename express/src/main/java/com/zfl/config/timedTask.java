package com.zfl.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
//
///**
// * @author sunzhenpeng
// * @data 2019/9/7
// * @description 定时任务类
// */
//@Component
//@EnableScheduling   // 1.开启定时任务
//@EnableAsync        // 2.开启多线程
//public class timedTask {
//
///**
//     * 收益计算定时任务
//     * @author sunzhenpeng
//     * @date 2019/9/7
//     * @return void
//     */
//
//    @Async
//@Scheduled(cron = "0 0 0 * * ?")  //间隔1秒
//public void first() throws InterruptedException {
//        System.out.println("定时任务开始 : " + LocalDateTime.now().toLocalTime()
// + "\r\n线程 : " + Thread.currentThread().getName()
//);
//
//        System.out.println("定时任务开始 : " + LocalDateTime.now().toLocalTime()
// + "\r\n线程 : " + Thread.currentThread().getName()
//);
//        //Thread.sleep(1000 * 10);
//    }
//
//}
