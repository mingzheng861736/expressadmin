package com.zfl.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.TbPayType;
import com.zfl.result.Result;
import com.zfl.service.TbPayTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 支付方式与支付设置表 前端控制器
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@RestController
@RequestMapping("/tb-pay-type")
public class TbPayTypeController {

    @Autowired
    private TbPayTypeService tbPayTypeService;

    /**
     *获取所有的支付方式
     * @author sunzhenpeng
     * @date 2019/9/12
     * @param request
     * @return com.zfl.result.Result
     */
    @PostMapping("/getPayTypeList")
    public Result getPayTypeList(HttpServletRequest request){
        List<TbPayType> payTypeList = tbPayTypeService.list(new QueryWrapper<>());
        return new Result(200,"查询成功！",payTypeList);
    }

}
