package com.xiaoshu.admin.controller.trackingController;
/**
 * 快递公司
 */

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.entity.TbOddNum;
import com.xiaoshu.admin.entity.TbTodayPrice;
import com.xiaoshu.admin.entity.TbTracking;
import com.xiaoshu.admin.service.TbOddNumService;
import com.xiaoshu.admin.service.TbTodayPriceService;
import com.xiaoshu.admin.service.TbTrackingService;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/tracking")
public class trackingController {
    @Autowired
    TbTrackingService trackingService;

    @Autowired
    TbOddNumService oddNumService;
    @Autowired
    TbTodayPriceService todayPriceService;

    @RequestMapping("/list")
    public String list(){
        return "admin/tracking/trackingList";
    }

    @RequestMapping("/trackingList")
    @ResponseBody
    public PageData<TbTracking> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                    @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                                    String trackingCompanyName) {
        PageData<TbTracking> userPageData = new PageData<>();
        if(trackingCompanyName==null||trackingCompanyName.equals("")){
            IPage<TbTracking> userPage = trackingService.page(new Page<>(page, limit), null);
            userPageData.setCount(userPage.getTotal());
            userPageData.setData(userPage.getRecords());
        }else {
            QueryWrapper qw =  new QueryWrapper();
            qw.like("tracking_company_name",trackingCompanyName);
            IPage<TbTracking> userPage = trackingService.page(new Page<>(page, limit), qw);
            userPageData.setCount(userPage.getTotal());
            userPageData.setData(userPage.getRecords());
        }
        return userPageData;
    }

    @RequestMapping("/add")
    public String add(){
        return "admin/tracking/trackAdd";
}

    @PostMapping("/trackAdd")
    @ResponseBody
    public ResponseEntity add(String trackingCompanyName){
        if(StringUtils.isBlank(trackingCompanyName)){
            return ResponseEntity.failure("快递公司名字不能为空");
        }

        QueryWrapper<TbTracking> qw = new QueryWrapper();
        qw.eq("tracking_company_name",trackingCompanyName);
        TbTracking tracking = trackingService.getOne(qw);
        if(tracking!=null){
            return ResponseEntity.failure("快递公司名字已存在");
        }
        TbTracking tbTracking = new TbTracking();
        tbTracking.setTrackingCompanyName(trackingCompanyName);
        tbTracking.setTrackingState(1);
        boolean b=  trackingService.save(tbTracking);
        return ResponseEntity.success("操作成功");
    }

    @GetMapping("/edit")
    public String edit(String id, ModelMap modelMap){
        TbTracking track = trackingService.getById(id);
        modelMap.addAttribute("track",track);
        return "admin/tracking/trackEdit";
    }

    @PostMapping("/edit")
    @ResponseBody
    public ResponseEntity edit(TbTracking tracking){
        trackingService.updateById(tracking);
        return ResponseEntity.success("操作成功");
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity delete(@RequestParam(value = "id",required = false)String id){
        if(StringUtils.isBlank(id)){
            return ResponseEntity.failure("ID不能为空");
        }
        //判断是否有引用
        QueryWrapper<TbTodayPrice> qwUser = new QueryWrapper<>();
        qwUser.eq("tracking",id);
        List<TbTodayPrice> tbtodayList = todayPriceService.list(qwUser);
        if(tbtodayList.size()!=0){
            return ResponseEntity.failure("该数据被引用,不能被删除!");
        }
        //判断是否有引用
        QueryWrapper<TbOddNum> qwOdd = new QueryWrapper<>();
        qwOdd.eq("tracking_company",id);
        List<TbOddNum> oddNumList = oddNumService.list(qwOdd);
        if(oddNumList.size()!=0){
            return ResponseEntity.failure("该数据被引用,不能被删除!");
        }
        boolean b=trackingService.removeById(Integer.valueOf(id));
        if(b){
            return ResponseEntity.success("操作成功");
        }else {
            return ResponseEntity.failure("删除失败");
        }
    }
}
