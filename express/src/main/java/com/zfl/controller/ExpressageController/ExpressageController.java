package com.zfl.controller.ExpressageController;

import com.zfl.service.expressageService.ExpressageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author sunzhenpeng
 * @data 2019/8/28
 * @description 快递单号查询 前端控制器
 */
@Controller
@ResponseBody
@RequestMapping("/expressage")
public class ExpressageController {

    @Autowired
    private ExpressageService expressageService;

    @RequestMapping("/findExpressageInfo")
    public Map<String,Object> findExpressageInfo(@RequestBody  String ExpressNumber){
        //return expressageService.findExpressageInfo(cohr,ExpressNumber);
        return expressageService.findExpressageInfo(ExpressNumber);
    }
}
