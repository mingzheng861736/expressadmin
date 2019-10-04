package com.zfl.controller.app.shipmentsapp;

import com.zfl.entity.AdminUser;
import com.zfl.entity.TbDraw;
import com.zfl.jwt.UserJwtService;
import com.zfl.result.Result;
import com.zfl.service.TbDrawService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author sunzhenpeng
 * @data 2019/9/24
 * @description 提现申请 控制器
 */
@RestController
@RequestMapping("/draw")
public class DrawApplyController {

    @Autowired
    private TbDrawService tbDrawService;

    @Autowired
    UserJwtService userJwtService;

    /**
     *用户提现申请
     * @author sunzhenpeng
     * @date 2019/9/25
     * @param request
     * @param draw
     * @return com.zfl.result.Result
     */
    @RequiresAuthentication
    @PostMapping("/getInviteCode")
    public Result drawApply(HttpServletRequest request,TbDraw draw ){
        //首先获取当前登录用户
        AdminUser user = userJwtService.getUser();
        if(user==null){
            return new Result(201,"请先登录！","");
        }
        if(user.getRemainingSum()<draw.getDrawPrice()){
            return new Result(201,"请输入合理的提现数额！","");
        }
        //提现手续费，暂时搁置
        draw.setDrawAddTime(new Date())
                .setDrawStatu(0)
                .setDrawUserId(user.getId())
                .setDrawServiceCharge("0.01");
        boolean save = tbDrawService.save(draw);
        if(!save)return new Result(201,"申请申请失败！","");
        return new Result(200,"提现申请成功！","");
    }
}
