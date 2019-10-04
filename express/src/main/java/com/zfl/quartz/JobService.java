package com.zfl.quartz;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class JobService {

    @Scheduled(cron = "*/5 * * * * ?")
    public void printTime() {
        System.out.println("current time :"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
    }
}
