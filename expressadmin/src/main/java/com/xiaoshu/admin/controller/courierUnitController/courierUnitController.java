package com.xiaoshu.admin.controller.courierUnitController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.entity.TbArea;
import com.xiaoshu.admin.entity.TbCourierUnit;
import com.xiaoshu.admin.entity.TbOddNum;
import com.xiaoshu.admin.service.AdminUserService;
import com.xiaoshu.admin.service.TbCourierUnitService;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/courier")
public class courierUnitController {
    @Autowired
    TbCourierUnitService tbCourierUnitService;
    @Autowired
    AdminUserService adminUserService;

    @RequestMapping("/list")
    public String list(){
        return "admin/courier/courierList";
    }
    @RequestMapping("/areaList")
    @ResponseBody
    public PageData<TbCourierUnit> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                 @RequestParam(value = "limit", defaultValue = "10") Integer limit
                                 ) {
        PageData<TbCourierUnit> userPageData = new PageData<>();
            IPage<TbCourierUnit> userPage = tbCourierUnitService.page(new Page<>(page, limit), null);
          List<TbCourierUnit> unitList = userPage.getRecords();
          if (unitList.size()!=0){
              for(int i=0;i<unitList.size();i++){
                unitList.get(i).setAdminUserCourier(adminUserService.getById(unitList.get(i).getUserId()));
                if(unitList.get(i).getUserAgencyId()!=null){
                    unitList.get(i).setAdminUserCourierAgency(adminUserService.getById(unitList.get(i).getUserAgencyId()));
                }
              }
          }
          userPage.setRecords(unitList);
            userPageData.setCount(userPage.getTotal());
            userPageData.setData(userPage.getRecords());
        return userPageData;
    }

    @GetMapping("/edit")
    public String edit(String id, ModelMap modelMap){
        TbCourierUnit tbCourierUnit = tbCourierUnitService.getById(id);
        modelMap.addAttribute("tbCourierUnit",tbCourierUnit);
        return "admin/courier/courierEdit";
    }
    @PostMapping("/edit")
    @ResponseBody
    public ResponseEntity edit(TbCourierUnit tbCourierUnit){
        tbCourierUnitService.updateById(tbCourierUnit);
        return ResponseEntity.success("操作成功");
    }
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity delete(@RequestParam(value = "id",required = false)String id){
        boolean b=tbCourierUnitService.removeById(Integer.valueOf(id));
        if(b){
            return ResponseEntity.success("操作成功");
        }else {
            return ResponseEntity.failure("删除失败");
        }
    }

}
