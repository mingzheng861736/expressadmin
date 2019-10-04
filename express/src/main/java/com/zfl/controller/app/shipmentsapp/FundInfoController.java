package com.zfl.controller.app.shipmentsapp;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminUser;
import com.zfl.entity.TbFundInfo;
import com.zfl.entity.TbOddNum;
import com.zfl.jwt.UserJwtService;
import com.zfl.result.Result;
import com.zfl.service.TbFundInfoService;
import com.zfl.service.TbOddNumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * <p>
 *
 * </p>
 *
 * @author lmz
 * @since 2019-08-30
 */
@RestController
@RequestMapping("userInfo")
public class FundInfoController {

    @Autowired
    UserJwtService userJwtService;
    @Autowired
    TbFundInfoService tbFundInfoService;
    @Autowired
    TbOddNumService tbOddNumService;
    /**
     * 统计用户的收益
     * @return
     */
    @PostMapping("accumulative")
    public Result accumulative(){
        //获取当前用户
        AdminUser adminUser = userJwtService.getUser();
        //总收益
        Double accumulativeSum = tbFundInfoService.accumulativeSum(adminUser.getId());
        //我的收益
        Double mySum = tbFundInfoService.mySum(adminUser.getId());
        //推荐收益
        Double recommendSum = tbFundInfoService.recommendSum(adminUser.getId());
        //获得推荐收益的集合
        QueryWrapper<TbFundInfo> qwfund = new QueryWrapper<>();
        qwfund.eq("user_id",adminUser.getId()).eq("money_purpose",1);
        List<TbFundInfo> fundInfoList = tbFundInfoService.list(qwfund);
        if(fundInfoList.size()!=0) {
            for (int i = 0; i < fundInfoList.size(); i++) {
                fundInfoList.get(i).setTbOddNum(tbOddNumService.getById(fundInfoList.get(i).getOddId()));
            }
        }
        Map<String,Object> moneyMap = new HashMap<>();
        moneyMap.put("accumulative",accumulativeSum);
        moneyMap.put("mySum",mySum);
        moneyMap.put("recommend",recommendSum);
        moneyMap.put("fundInfoList",fundInfoList);
        return new Result(200,"请求成功",moneyMap);
    }

    //我的收益
    @PostMapping("myIncome")
    public Result myIncome(){
        AdminUser adminUser = userJwtService.getUser();
        QueryWrapper<TbFundInfo> qw = new QueryWrapper<>();
        qw.eq("user_id",adminUser.getId()).eq("money_purpose",0);
        List<TbFundInfo> fundInfoList = tbFundInfoService.list(qw);
        if(fundInfoList.size()!=0) {
            for (int i = 0; i < fundInfoList.size(); i++) {
                fundInfoList.get(i).setTbOddNum(tbOddNumService.getById(fundInfoList.get(i).getOddId()));
            }
        }

        return new Result(200,"请求成功",fundInfoList);
    }





}
