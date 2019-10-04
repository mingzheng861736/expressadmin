package com.xiaoshu.admin.controller.genercontroller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.entity.TbArea;
import com.xiaoshu.admin.entity.TbUserSingle;
import com.xiaoshu.admin.entity.TbVip;
import com.xiaoshu.admin.entity.vo.AdminUserVipVo;
import com.xiaoshu.admin.service.AdminUserService;
import com.xiaoshu.admin.service.TbAreaService;
import com.xiaoshu.admin.service.TbUserSingleService;
import com.xiaoshu.admin.service.TbVipService;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.DateUtils;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: comadmin->VipUserController
 * @description: vip用户控制器
 * @author: zc
 * @create: 2019-09-02 12:28
 **/
@Controller
@RequestMapping("admin/vipUser")
public class VipUserController {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private TbAreaService tbAreaService;

    @Autowired
    private TbVipService tbVipService;

    @Autowired
    private TbUserSingleService tbUserSingleService;

    @GetMapping("list")
    @SysLog("跳转系统用户列表页面")
    public String list(ModelMap modelMap){
        //查询会员
        List<TbVip> vips = tbVipService.list(null);
        //查询区域
        List<TbArea> areas = tbAreaService.list(null);
        modelMap.put("vips",vips);
        modelMap.put("areas",areas);
        return "admin/vipUser/vipUserlist";
    }

    @RequiresPermissions("sys:vipUser:list")
    @PostMapping("list")
    @ResponseBody
    public PageData<AdminUser> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                               @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                               ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        PageData<AdminUser> userPageData = new PageData<>();
        AdminUser adminUser = new AdminUser();
        QueryWrapper<AdminUser> userWrapper = new QueryWrapper<>();
        if(!map.isEmpty()){
            String type = (String) map.get("user_type");
            if(StringUtils.isNotBlank(type)) {
                userWrapper.eq("user_type", type);
            }
            String keys = (String) map.get("key");
            if(StringUtils.isNotBlank(keys)) {
                userWrapper.and(wrapper -> wrapper.like("account", keys).or().like("name", keys));
            }
        }
        IPage<AdminUser> userPage = adminUserService.page(new Page<>(page,limit),userWrapper);
        for (AdminUser vipUser : userPage.getRecords()){
            vipUser.setTbVips(tbVipService.list(null));
            vipUser.setTbAreas(tbAreaService.list(null));
        }
        userPageData.setCount(userPage.getTotal());
        userPageData.setData(userPage.getRecords());
        return userPageData;
    }

    @RequiresPermissions("sys:user:lock")
    @PostMapping("lock")
    @ResponseBody
    @SysLog("锁定或开启系统用户")
    public ResponseEntity lock(@RequestParam(value = "id",required = false)String id){
        if(StringUtils.isBlank(id)){
            return ResponseEntity.failure("参数错误");
        }
        AdminUser user = adminUserService.getById(id);
        if(user == null){
            return ResponseEntity.failure("用户不存在");
        }
        user.setStatus(!user.getStatus());
        adminUserService.updateById(user);
        return ResponseEntity.success("操作成功");
    }
    @RequiresPermissions("sys:vipUser:list")
    @GetMapping("vipDetails")
    @SysLog("查看用户详细信息")
    public String vipDetails(@RequestParam(value = "id",required = false)String id,ModelMap modelMap){
        System.out.println(id);
        AdminUser adminUser = adminUserService.getById(id);
        //查询用户的会员
        AdminUserVipVo adminUserVipVo = new AdminUserVipVo();
        adminUserVipVo.setAccount(adminUser.getAccount());
        adminUserVipVo.setName(adminUser.getName());
        adminUserVipVo.setUserInviteCode(adminUser.getUserInviteCode());
        try {
            adminUserVipVo.setCreateTime(DateUtils.dateParse(adminUser.getCreateTime(),DateUtils.DATE_TIME_PATTERN));
        } catch (ParseException e) {

        }
        adminUserVipVo.setTbVip(tbVipService.getById(adminUser.getUserVip()));
        adminUserVipVo.setTbArea(tbAreaService.getById(adminUser.getUserArea()));
        //查看用户当前余额
        //用户创建时间
        modelMap.put("adminUserVipVo",adminUserVipVo);
        return "admin/vipUser/vipUserInfo";
    }
    @RequiresPermissions("sys:vipUser:delete")
    @PostMapping("delete")
    @SysLog("查看用户详细信息")
    @ResponseBody
    public ResponseEntity delete(String id){
        if(StringUtils.isBlank(id)){
            return ResponseEntity.failure("参数错误");
        }
        AdminUser user = adminUserService.getById(id);
        if(user == null){
            return ResponseEntity.failure("用户不存在");
        }
        boolean isRmove = adminUserService.removeById(Integer.valueOf(id));
        if (isRmove){
            return ResponseEntity.success("操作成功");
        }else {
            return ResponseEntity.success("操作失败");
        }
    }

    /**
     *vip用户快递报价页面入口
     * @author sunzhenpeng
     * @date 2019/9/26
     * @return java.lang.String
     */
    @RequestMapping("/inlet")
    public String list(){
        return "admin/vipUser/vipUserSingleList";
    }

    /**
     *vip用户快递报价列表
     * @author sunzhenpeng
     * @date 2019/9/26
     * @return com.xiaoshu.common.base.PageData<com.xiaoshu.admin.entity.TbUserSingle>
     */
    //@RequiresPermissions("sys:vipUser:single")
    @PostMapping("singleList")
    @ResponseBody
    public PageData<TbUserSingle> singlePageData (@RequestParam(value = "page",defaultValue = "1")Integer page,String startDate,String endDate,
                                                  @RequestParam(value = "limit",defaultValue = "10")Integer limit, HttpServletRequest request){
        PageData<TbUserSingle> applyPageData = new PageData<>();
        QueryWrapper<TbUserSingle> applyWrapper = new QueryWrapper<>();
        if(startDate!=null&&!startDate.equals(""))applyWrapper.ge("add_time",startDate);//大于等于
        if(endDate!=null&&!endDate.equals(""))applyWrapper.le("add_time",endDate);//小于等于
        IPage<TbUserSingle> userPage = tbUserSingleService.page(new Page<>(page,limit),applyWrapper);
        userPage.getRecords().forEach(ap->{
            ap.setAdminUser(adminUserService.getById(ap.getUserId()));
        });
        applyPageData.setCount(userPage.getTotal());
        applyPageData.setData(userPage.getRecords());
        return applyPageData;

    }

    /**
     *修改报价入口
     * @author sunzhenpeng
     * @date 2019/9/26
     * @param id
     * @return java.lang.String
     */
    @RequestMapping("/changeInlet")
    public String changeInlet(Model model,Integer id){
        TbUserSingle tbUserSingle = tbUserSingleService.getById(id);
        tbUserSingle.setAdminUser(adminUserService.getById(tbUserSingle.getUserId()));
        model.addAttribute("tbUserSingle",tbUserSingle);
        return "admin/vipUser/singlePriceChange";
    }

    /**
     *修改报价
     * @author sunzhenpeng
     * @date 2019/9/26
     * @param tbUserSingle
     * @return com.xiaoshu.common.util.ResponseEntity
     */
    @PostMapping("/singlePriceChange")
    @ResponseBody
    public ResponseEntity singlePriceChange(TbUserSingle tbUserSingle){
        tbUserSingle.setUpdateTime(new Date());
        boolean up = tbUserSingleService.updateById(tbUserSingle);
        if(!up)return ResponseEntity.failure("修改失败！");
        return ResponseEntity.success("修改成功！");
    }

}
