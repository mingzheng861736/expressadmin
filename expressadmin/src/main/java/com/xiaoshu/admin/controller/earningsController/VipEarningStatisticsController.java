package com.xiaoshu.admin.controller.earningsController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.admin.entity.TbFundInfo;
import com.xiaoshu.admin.entity.TbVip;
import com.xiaoshu.admin.entity.eraningsStatistics.EraningsStatistics;
import com.xiaoshu.admin.service.TbVipService;
import com.xiaoshu.admin.service.eraningsStatistics.EraningsStatisticsService;
import com.xiaoshu.admin.service.impl.TbFundInfoServiceImpl;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import java.text.ParseException;
import java.util.List;

/**
 * @author sunzhenpeng
 * @data 2019/9/2
 * @description 会员收益统计 前端控制器
 */
@Controller
@RequestMapping("/admin/vipEarningStatistics")
public class VipEarningStatisticsController {

    @Autowired
    private TbVipService tbVipService;

    @Autowired
    private EraningsStatisticsService eraningsStatisticsService;

    @Autowired
    private TbFundInfoServiceImpl tbFundInfoService;


    private static String tb_addTime = "";
    private static String tb_account = "";
    /**
     * 会员收益列表页面入口
     * @author sunzhenpeng
     * @date 2019/9/3
     * @param model
     * @return java.lang.String
     */
    @RequiresPermissions("admin:vipEarningStatistics:inlet")
    @GetMapping("inlet")
    @SysLog("跳转会员收益列表页面")
    public String list(Model model){
        //获取所有的vip等级
        List<TbVip> list = (List<TbVip>)tbVipService.list(new QueryWrapper<TbVip>());
        model.addAttribute("vipUserList",list);
        return "admin/earningsStatistics/vipEarningsStatistics";
    }
    /**
     * 查询统计计算会员收益
     * @author sunzhenpeng
     * @date 2019/9/2
     * @param page
     * @param limit
     * @param eraningsStatistics
     * @return com.xiaoshu.common.base.PageData<java.util.Map<java.lang.String,java.lang.Object>>
     */
    //@RequiresPermissions("sys:earning:list")
    @PostMapping("lists")
    @ResponseBody
    public PageData<EraningsStatistics> list (@RequestParam(value = "page",defaultValue = "1")Integer page,ServletRequest request,
                                              @RequestParam(value = "limit",defaultValue = "10")Integer limit,EraningsStatistics eraningsStatistics){
        PageHelper.startPage(page,limit,true);
        //先获取vipUser列表
        List<EraningsStatistics> eraningsStatisticsList = eraningsStatisticsService.vipUserEraningsList(eraningsStatistics);
        PageInfo<EraningsStatistics> pageInfo = new PageInfo<>(eraningsStatisticsList);
        pageInfo.getList();
        PageData<EraningsStatistics> userPageData = new PageData<>();
        /*IPage<EraningsStatistics> userPage = eraningsStatisticsService.page(new Page<>(page,limit),null);*/
        userPageData.setCount(pageInfo.getTotal());
        userPageData.setData(pageInfo.getList());
        return userPageData;

    }

    /**
     * 会员收益明细页面入口
     * @author sunzhenpeng
     * @date 2019/9/3
     * @return java.lang.String
     */
    @GetMapping("detailInlet")
    @SysLog("会员收益明细页面")
    public String detail(String addTime,String account,Model model){
        model.addAttribute("addTime",addTime);
        model.addAttribute("account",account);
        tb_addTime = addTime+" 00:00:00";
        tb_account = account;
        return "admin/earningsStatistics/EraningsDetail";
    }


    /**
     * 会员收益明细列表
     * @author sunzhenpeng
     * @date 2019/9/4
     * @param page
     * @param limit
     * @return com.xiaoshu.common.base.PageData<com.xiaoshu.admin.entity.eraningsStatistics.EraningsStatistics>
     */
    @PostMapping("detailList")
    @ResponseBody
    public PageData<TbFundInfo> detailList (@RequestParam(value = "page",defaultValue = "1")Integer page,ServletRequest request,
                                              @RequestParam(value = "limit",defaultValue = "10")Integer limit,TbFundInfo tbFundInfo) throws ParseException {

        PageHelper.startPage(page,limit,true);
        /*if(StringUtils.isNotEmpty(tb_addTime)){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            tbFundInfo.setStartDate(sdf.format(sdf.parse(tb_addTime)));
            Calendar calendar   =   new GregorianCalendar();
            calendar.setTime(sdf.parse(tb_addTime));
            calendar.add(calendar.DATE,1);//把日期往后增加一天.整数往后推,负数往前移动
            tbFundInfo.setEndDate(sdf.format(calendar.getTime()));
        }*/
        if(StringUtils.isNotEmpty(tb_account))tbFundInfo.setAccount(tb_account);
        //先获取vipUser列表
        List<TbFundInfo> tbFundInfoList = tbFundInfoService.getTbFundInfoList(tbFundInfo);
        PageInfo<TbFundInfo> pageInfo = new PageInfo<>(tbFundInfoList);
        pageInfo.getList();
        PageData<TbFundInfo> userPageData = new PageData<>();
        userPageData.setCount(pageInfo.getTotal());
        userPageData.setData(pageInfo.getList());
        return userPageData;

    }

}
