package com.zfl.controller.app.shipmentsapp;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminUser;
import com.zfl.entity.TbModeDespatch;
import com.zfl.entity.TbSender;
import com.zfl.entity.TbUserSendAddress;
import com.zfl.jwt.UserJwtService;
import com.zfl.result.Result;
import com.zfl.service.TbModeDespatchService;
import com.zfl.service.TbSenderService;
import com.zfl.service.TbUserSendAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("shipmentsapp")
public class SenderController {

    @Autowired
    private TbSenderService tbSenderService;
    @Autowired
    private TbModeDespatchService tbModeDespatchService;
    @Autowired
    private TbUserSendAddressService tbUserSendAddressService;
    @Autowired
    private UserJwtService userJwtService;

    /**
     * 查询所有收货方式
     * 查询所有寄件方式
     * @return
     */
    @PostMapping("/show")
    public Result show() {
        AdminUser user = userJwtService.getUser();
        JSONObject jsonObject = new JSONObject();
        List<TbUserSendAddress> tbUserSendAddressList = tbUserSendAddressService.list(new QueryWrapper<TbUserSendAddress>().eq("user_id",user.getId()));
        List<TbModeDespatch> tbModeDespatchList = tbModeDespatchService.list();
        List<TbSender> tbSenderList = tbSenderService.list();
        jsonObject.put("tbUserSendAddressList", tbUserSendAddressList);
        jsonObject.put("tbModeDespatchList", tbModeDespatchList);
        jsonObject.put("tbSenderList", tbSenderList);
        return new Result(200,"查询成功",jsonObject);
    }


}
