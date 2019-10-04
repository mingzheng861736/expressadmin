package com.xiaoshu.admin.controller.agencyApplyController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.TbAgencyApply;
import com.xiaoshu.admin.service.AdminUserService;
import com.xiaoshu.admin.service.TbAgencyApplyService;
import com.xiaoshu.admin.service.TbAreaService;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author sunzhenpeng
 * @data 2019/9/17
 * @description 代理申请 控制器
 */
@Controller
@RequestMapping("/admin/agency")
public class AgencyApplyController {

    @Autowired
    private TbAgencyApplyService tbAgencyApplyService;

    @Autowired
    private TbAreaService tbAreaService;

    @Autowired
    private AdminUserService adminUserService;

    /**
     *代理申请入口
     * @author sunzhenpeng
     * @date 2019/9/17
     * @return java.lang.String
     */
    @RequestMapping("/inlet")
    public String list(){
        return "admin/agency/agencyApply";
    }

    /**
     *代理申请列表
     * @author sunzhenpeng
     * @date 2019/9/17
     * @param page
     * @param limit
     * @param tbAgencyApply
     * @return com.xiaoshu.common.base.PageData<com.xiaoshu.admin.entity.TbAgencyApply>
     */
    @RequestMapping("/applyList")
    @ResponseBody
    public PageData<TbAgencyApply> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                        @RequestParam(value = "limit", defaultValue = "10") Integer limit,String startDate,String endDate,
                                        TbAgencyApply tbAgencyApply) {
        PageData<TbAgencyApply> applyPageData = new PageData<>();
        QueryWrapper<TbAgencyApply> applyWrapper = new QueryWrapper<>();
        if(startDate!=null&&!startDate.equals(""))applyWrapper.ge("create_time",startDate);//大于等于
        if(endDate!=null&&!endDate.equals(""))applyWrapper.le("create_time",endDate);//小于等于
        applyWrapper.eq("audit_status",0);
        IPage<TbAgencyApply> userPage = tbAgencyApplyService.page(new Page<>(page,limit),applyWrapper);
        userPage.getRecords().forEach(ap->{
            ap.setAdminUser(adminUserService.getById(ap.getUserId()));
            ap.setTbArea(tbAreaService.getById(ap.getAreaId()));
        });
        applyPageData.setCount(userPage.getTotal());
        applyPageData.setData(userPage.getRecords());
        return applyPageData;
    }

    /**
     * 代理审核入口
     * @author sunzhenpeng
     * @date 2019/9/18
     * @param id
     * @param modelMap
     * @return java.lang.String
     */
    @RequestMapping("/auditInlet")
    public String inlet(String id, ModelMap modelMap){
        TbAgencyApply tbAgencyApply = tbAgencyApplyService.getById(id);
        modelMap.addAttribute("tbAgencyApply",tbAgencyApply);
        return "admin/agency/agencyAudit";
    }

    /**
     * 代理审核
     * @author sunzhenpeng
     * @date 2019/9/18
     * @param tbAgencyApply
     * @return com.xiaoshu.common.util.ResponseEntity
     */
    @PostMapping("/agencyAudit")
    @ResponseBody
    public ResponseEntity agencyAudit(TbAgencyApply tbAgencyApply){
        tbAgencyApply.setUpdateTime(new Date());
        boolean a = tbAgencyApplyService.updateById(tbAgencyApply);
        if(!a){
            return ResponseEntity.failure("审核失败！");
        }
        return ResponseEntity.success("审核成功！");
    }

}
