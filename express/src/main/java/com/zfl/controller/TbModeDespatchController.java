package com.zfl.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.TbModeDespatch;
import com.zfl.result.Result;
import com.zfl.service.TbModeDespatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 发货方式表 前端控制器
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@RestController
@RequestMapping("/tb-mode-despatch")
public class TbModeDespatchController {

    @Autowired
    private TbModeDespatchService tbModeDespatchService;

    @PostMapping("/getModeDespatchlist")
    public Result getModeDespatchlist (HttpServletRequest request){
        List<TbModeDespatch> ModeDespatchlist = tbModeDespatchService.list(new QueryWrapper<>());
        return new Result(200,"查询成功！",ModeDespatchlist);
    }
}
