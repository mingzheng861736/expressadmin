package com.xiaoshu.admin.controller.areaController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.entity.TbArea;
import com.xiaoshu.admin.entity.TbOddNum;
import com.xiaoshu.admin.service.AdminUserService;
import com.xiaoshu.admin.service.TbAreaService;
import com.xiaoshu.admin.service.TbOddNumService;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.realm.AuthRealm;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/system/area")
public class AreaController {
    @Autowired
    TbAreaService areaService;
    @Autowired
    AdminUserService adminUserService;

    @Autowired
    TbOddNumService oddNumService;



    @RequestMapping("/list")
    public String list(){
        return "admin/area/list";
    }


    @RequiresPermissions("sys:area:list")
    @RequestMapping("/areaList")
    @ResponseBody
    public PageData<TbArea> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                    @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                                 String areaName) {

        PageData<TbArea> userPageData = new PageData<>();
        if(areaName==null||areaName.equals("")){
            IPage<TbArea> userPage = areaService.page(new Page<>(page, limit), null);
            userPageData.setCount(userPage.getTotal());
            userPageData.setData(userPage.getRecords());
        }else {
            QueryWrapper qw =  new QueryWrapper();
            qw.like("area_name",areaName);
            IPage<TbArea> userPage = areaService.page(new Page<>(page, limit), qw);
            userPageData.setCount(userPage.getTotal());
            userPageData.setData(userPage.getRecords());
        }
        return userPageData;
    }
    @RequiresPermissions("sys:area:delete")
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity delete(@RequestParam(value = "id",required = false)String id){
        if(StringUtils.isBlank(id)){
            return ResponseEntity.failure("ID不能为空");
        }
        //判断该区域在用户表是否有引用
        QueryWrapper<AdminUser> qwUser = new QueryWrapper<>();
        qwUser.eq("user_area",id);
       List<AdminUser> adminUserList = adminUserService.list(qwUser);
       if(adminUserList.size()!=0){
           return ResponseEntity.failure("该数据被引用,不能被删除!");
       }
       //判断该区域在订单表是否有引用
        QueryWrapper<TbOddNum> qwOdd = new QueryWrapper<>();
       qwOdd.eq("order_area",id);
       List<TbOddNum> oddNumList = oddNumService.list(qwOdd);
        if(oddNumList.size()!=0){
            return ResponseEntity.failure("该数据被引用,不能被删除!");
        }

        boolean b=areaService.removeById(Integer.valueOf(id));
        if(b){
            return ResponseEntity.success("操作成功");
        }else {
            return ResponseEntity.failure("删除失败");
        }
    }
    @RequestMapping("/add")
    public String add(){
        return "admin/area/add";
    }


    @RequiresPermissions("sys:area:add")
    @PostMapping("/postAdd")
    @ResponseBody
    public ResponseEntity add(String areaName){
        if(StringUtils.isBlank(areaName)){
            return ResponseEntity.failure("区域名称不能为空");
        }
        QueryWrapper<TbArea> qw = new QueryWrapper();
        qw.eq("area_name",areaName);
        TbArea tbArea = areaService.getOne(qw);
        if(tbArea!=null){
            return ResponseEntity.failure("区域名称已存在");
        }
        AuthRealm.ShiroUser principal = (AuthRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        TbArea area = new TbArea();
        area.setAreaName(areaName);
        area.setAreaDividePerson(principal.getNickName());
        boolean b=  areaService.save(area);
        return ResponseEntity.success("操作成功");
    }

    @GetMapping("/edit")
    public String edit(String id, ModelMap modelMap){
        TbArea area = areaService.getById(id);
        modelMap.addAttribute("area",area);
        return "admin/area/edit";
    }
    @RequiresPermissions("sys:area:edit")
    @PostMapping("/edit")
    @ResponseBody
    public ResponseEntity edit(TbArea area){

        if (StringUtils.isBlank(area.getAreaName())) {
            return ResponseEntity.failure("区域名称不能为空");
        }
        QueryWrapper<TbArea> qw = new QueryWrapper();
        qw.eq("area_name",area.getAreaName());
        TbArea tbArea = areaService.getOne(qw);
        if(tbArea!=null){
            return ResponseEntity.failure("区域名称已存在");
        }
        areaService.updateById(area);
        return ResponseEntity.success("操作成功");
    }
}
