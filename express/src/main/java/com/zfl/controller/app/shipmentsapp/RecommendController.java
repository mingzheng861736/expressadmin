package com.zfl.controller.app.shipmentsapp;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminUser;
import com.zfl.entity.TbRecommend;
import com.zfl.jwt.UserJwtService;
import com.zfl.result.Result;
import com.zfl.service.AdminUserService;
import com.zfl.service.TbRecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("recommend")
public class RecommendController {
    @Autowired
    TbRecommendService recommendService;
    @Autowired
    AdminUserService userService;
    @Autowired
    UserJwtService userJwtService;

    //查看当前用户共推荐多少人
    @PostMapping("grade")
    public Result grade() {
        AdminUser adminUser = userJwtService.getUser();
        QueryWrapper<TbRecommend> qw = new QueryWrapper<>();
        qw.eq("recommend", adminUser.getId());
        List<TbRecommend> recommendList = recommendService.list(qw);
        if (recommendList.size() != 0) {
            for (int i = 0; i < recommendList.size(); i++) {
                recommendList.get(i).setAdminUser(userService.getById(recommendList.get(i).getRecommended()));
            }
        }
        return new Result(200, "请求成功", recommendList);
    }
}

