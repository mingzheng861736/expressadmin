package com.xiaoshu.admin;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xiaoshu.admin.entity.Menu;
import com.xiaoshu.admin.service.MenuService;
import com.xiaoshu.admin.service.TbAreaService;
import org.apache.commons.lang3.StringUtils;
import com.xiaoshu.admin.service.eraningsStatistics.EarningsCalculateService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import java.util.List;
import java.util.Map;

import java.util.Map;


@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminApplicationTests {

    @Autowired
    MenuService menuService;

    @Autowired
    private EarningsCalculateService earningsCalculateService;


    @Test
    public void contextLoads() {
        QueryWrapper<Menu> wrapper = new QueryWrapper<>();
        Object o = menuService.getObj(wrapper.select("max(sort) as sort").isNull("parent_id"));
        System.out.println(o.toString());

    }
        @Autowired
    TbAreaService areaService;

    @Test
    public void Blank(){
        List<Map<String, Object>> listMaps = areaService.listMaps(null);
        System.out.println(listMaps.toString());

    }



    public static void main(String[] args) throws ParseException {
        String strDate = "2018-07-18T08:12:08.000+0000";
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'+0000'");
        Date date = format.parse(strDate);
        System.out.println(date.toString());
    }




}
