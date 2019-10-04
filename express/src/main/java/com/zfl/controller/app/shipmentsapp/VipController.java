package com.zfl.controller.app.shipmentsapp;

import com.zfl.entity.AdminUser;
import com.zfl.entity.TbVip;
import com.zfl.jwt.UserJwtService;
import com.zfl.result.Result;
import com.zfl.service.TbFundInfoService;
import com.zfl.service.TbVipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * <p>
 *会员等级所需的数据
 * </p>
 *
 * @author lmz
 * @since 2019-08-31
 */
@RestController
@RequestMapping("/vipGrade")
public class VipController {
    @Autowired
    UserJwtService userJwtService;
    @Autowired
    TbFundInfoService tbFundInfoService;
    @Autowired
    TbVipService vipService;

    @PostMapping("rule")
    public Result grade(){
       AdminUser adminUser =userJwtService.getUser();
       //我的积分
      // Double integral =tbFundInfoService.accumulativeSum(adminUser.getId());
       // Double integral = adminUser.getRemainingSum();
        Map result = new HashMap();
        result.put("integral",adminUser);
       //积分规则
        List<TbVip> vipList = vipService.list();
         result.put("rule",vipList);
        return new Result(200,"",result);
    }
}
