package com.zfl;

import com.alipay.api.domain.QRcode;
import com.zfl.entity.TbOddNum;
import com.zfl.redisservice.RedisService;
import com.zfl.service.TbOddNumService;
import com.zfl.util.DateUtils;
import com.zfl.util.Md5Util;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 * @Auther: wbh
 * @Date: 2019/9/5 16:31
 * @Description:
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class PastOrderTest {

    @Autowired
    private TbOddNumService oddNumService;
    @Autowired
    private RedisService redisService;
    //格式化日期,用于指定keys
    private DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");

    @Test
    public void test3(){
    }

    @Test
    public void test2() {
        System.out.println("redisService.decr(\"double\",5) = " + redisService.decr("double", 5));
        System.out.println("Md5Util.getRandomNum() = " + Md5Util.getRandomNum());
        ArrayList<Object> list = new ArrayList<>();
        list.add(1);
        list.clear();
        System.out.println(list.size());
    }

    @Test
    public void test() throws ParseException {
        Calendar cal = Calendar.getInstance();
        Date date = DateUtils.dateParse("2019-09-07 14:00:00", DateUtils.DATE_TIME_PATTERN);
        cal.setTime(date);
        ArrayList<TbOddNum> oddNumList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            cal.add(Calendar.SECOND, 10);
            TbOddNum oddNum = new TbOddNum();
            oddNum.setUserId(11);
            oddNum.setAddresser("1");
            oddNum.setRecipients("aaa");
            oddNum.setGoodInfo("a");
            oddNum.setModeOfDespatch(1);
            oddNum.setOrderState(0);
            oddNum.setAddTime(cal.getTime());
            oddNum.setSysNum("1");
            oddNum.setSenderType(1);
            oddNum.setTrackingNumber(df.format(new Date()) + Md5Util.getRandomNum());
            oddNumList.add(oddNum);
        }
        oddNumService.saveBatch(oddNumList);

    }
    @Test
    public void al(){
        String content="创建项目成功";
        boolean[][] bs=null;


    }

}
