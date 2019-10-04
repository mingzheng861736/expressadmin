package com.zfl.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.TbSender;
import com.zfl.result.Result;
import com.zfl.service.TbSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@RestController
@RequestMapping("/tb-sender")
public class TbSenderController {

    @Autowired
    private TbSenderService tbSenderService;

    @PostMapping("/getSenderList")
    public Result getSenderList(HttpServletRequest request){
        List<TbSender> list = tbSenderService.list(new QueryWrapper<>());
        return new Result(200,"查询成功！",list);
    }
}
