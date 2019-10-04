package com.zfl.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminUser;
import com.zfl.entity.TbArea;
import com.zfl.result.Result;
import com.zfl.service.AdminUserService;
import com.zfl.service.TbAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 区域表 前端控制器
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@RestController
@RequestMapping("/tb-area")
public class TbAreaController {

    @Autowired
    private TbAreaService tbAreaService;

    @Autowired
    private AdminUserService adminUserService;

    /**
     *获取区域list
     * @author sunzhenpeng
     * @date 2019/9/12
     * @param request
     * @return com.zfl.result.Result
     */
    @PostMapping("/getAreaList")
    public Result getAreaList (HttpServletRequest request){
        List<TbArea> list = tbAreaService.list(new QueryWrapper<>());
        return new Result(200,"查询成功！",list);
    }

    /**
     *获取尚无人代理的区域
     * @author sunzhenpeng
     * @date 2019/9/23
     * @return com.zfl.result.Result
     */
    @PostMapping("/getAgencyAreaList")
    public Result getAgencyAreaList (HttpServletRequest request){
        List<TbArea> areaList = new ArrayList<>();
        List<TbArea> list = tbAreaService.list(new QueryWrapper<>());
        list.forEach(a->{
           List<AdminUser> userList = adminUserService.list(new QueryWrapper<AdminUser>().eq("user_area",a.getId())
                                                                    .eq("user_vip",4));
           if(userList==null||userList.size()==0){
               areaList.add(a);
           }
        });
        return new Result(200,"查询成功！",areaList);
    }

}
