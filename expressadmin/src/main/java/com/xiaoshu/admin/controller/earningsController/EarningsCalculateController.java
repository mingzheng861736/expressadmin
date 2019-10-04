package com.xiaoshu.admin.controller.earningsController;

import com.xiaoshu.admin.service.eraningsStatistics.EarningsCalculateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import java.util.Map;

/**
 * @author sunzhenpeng
 * @data 2019/9/6
 * @description 收益计算
 */
@Controller
@RequestMapping("/earningsCalculate")
public class EarningsCalculateController {

    @Autowired
    private EarningsCalculateService earningsCalculateService;

    /**
     *功能描述
     * @author sunzhenpeng
     * @date 2019/9/6
     * @return resultMap
     */
    @PostMapping("/ss")
    @ResponseBody
    public Map<String,Object> earningsCalculatess(ServletRequest request) throws Exception {

        //Map<String,Object> resultMap = earningsCalculateService.earningsCalculate();

        return null;
    }
}
