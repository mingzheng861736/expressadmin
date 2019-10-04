package com.zfl.controller.app.shipmentsapp;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.*;
import com.zfl.entity.vo.ApplicationAgency;
import com.zfl.jwt.UserJwtService;
import com.zfl.result.Result;
import com.zfl.service.AdminUserRoleService;
import com.zfl.service.AdminUserService;
import com.zfl.service.TbAgencyApplyService;
import com.zfl.service.TbUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.Date;


@RestController
@RequestMapping("shipmentsapp")
public class ApplicationAgencyController {

    @Autowired
    private AdminUserService adminUserService;
    @Autowired
    private TbUserInfoService tbUserInfoService;
    @Autowired
    private AdminUserRoleService adminUserRoleService;
    @Autowired
    private UserJwtService userJwtService;

    @Autowired
    private TbAgencyApplyService tbAgencyApplyService;

    /**
     * 申请代理
     * @param applicationAgency
     * @return
     */

    @PostMapping("/applicationAgency")
    public Result applicationAgency(@RequestBody  ApplicationAgency applicationAgency) {
        applicationAgency.validateParams();
        //获取登录会员信息
        AdminUser user = userJwtService.getUser();
        JSONObject jsonObject = new JSONObject();
        if (user != null) {
            //判断会员等级是否到达铂金
            if (user.getUserVip() >= 3) {
                //查询userInfo表中对应此会员的数据
                TbUserInfo tbUserInfo = tbUserInfoService.getOne(new QueryWrapper<TbUserInfo>().eq("user_id", user.getId()));
                if(tbUserInfo!=null&&tbUserInfo.getIsCertification()==1){
                    ;return new Result(203,"未认证！","");
                }
                //获取用户认证信息
                JSONObject userInfo = JSONObject.parseObject(tbUserInfo.getUserInfoJson());
                if(!userInfo.getString("userName").equals(applicationAgency.getUserName())||
                        !userInfo.getString("userCard").equals(applicationAgency.getUserCard())){
                    ;return new Result(202,"信息与认证信息不符，请重新确认！","");
                }
                TbAgencyApply apply = new TbAgencyApply();
                apply.setUserId(user.getId())//用户编号
                        .setCardNumber(applicationAgency.getUserCard())//身份证号
                        .setTelNumber(applicationAgency.getUserPhone())//电话
                        .setAreaId(Integer.parseInt(applicationAgency.getArea()))//区域
                        .setApplyReason(applicationAgency.getReason())//申请缘由
                        .setAuditStatus(0)//状态为待审核
                        .setCreateTime(new Date());//申请时间
                boolean save = tbAgencyApplyService.save(apply);
                if(save){
                    return new Result(200,"申请提交成功！","");
                }
                return new Result(202,"会员信息不存在！","");
            }
            return new Result(202,"会员等级不符合要求！","");
        }
        return new Result(202, "会员不存在！", "");
    }

}
