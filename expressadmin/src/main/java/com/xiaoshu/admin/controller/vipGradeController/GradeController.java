package com.xiaoshu.admin.controller.vipGradeController;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.TbVip;
import com.xiaoshu.admin.service.TbVipService;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.result.Result;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping("admin/vip")
public class GradeController {
    @Autowired
    private TbVipService tbVipService;

    @GetMapping("list")
    @SysLog("跳转VIP等级列表页面")
    public String list(){
        return "admin/vipGrade/vipList";
    }

    @GetMapping("add")
    @SysLog("跳转添加VIP等级页面")
    public String addGrade(){
        return "admin/vipGrade/vipAdd";
    }

    @GetMapping("update")
    @SysLog("跳转修改VIP等级页面")
    public ModelAndView showUpdate(String id) {
        ModelAndView modelAndView = new ModelAndView("admin/vipGrade/vipUpdate");
       // TbVip tbVip = tbVipService.getOne(new QueryWrapper<TbVip>().eq("id", id));
        TbVip tbVip = tbVipService.getById(id);
        modelAndView.addObject("vip", tbVip);
        return modelAndView;
    }

    /**
     * 添加VIP等级
     * @param tbVip
     * @return
     */

    @RequiresPermissions("sys:vip:add")
    @PostMapping("addGrade")
    @ResponseBody
    public Result addGrade(@RequestBody TbVip tbVip){
        tbVip.validateParams();
        boolean isSave = tbVipService.save(tbVip);
        if (isSave){
            return new Result(200,"添加成功",tbVip);
        }else {
            return new Result(201,"添加失败","");
        }
    }


    /**
     * vip等级修改
     * @param tbVip
     * @return
     */

    @RequiresPermissions("sys:vip:update")
    @PostMapping("updateGrade")
    @ResponseBody
    public Result updateGrade(@RequestBody TbVip tbVip){
        tbVip.validateParams();
        if (tbVip.getId()==null){
            return new Result(201,"更新操作需要传入id","");
        }
        boolean isSave = tbVipService.updateById(tbVip);
        if (isSave){
            return new Result(200,"更新成功",tbVip);
        }else {
            return new Result(202,"更新失败","");
        }
    }


    /**
     * vip等级删除
     * @param id
     * @return
     */
    @RequiresPermissions("sys:vip:dele")
    @PostMapping("deleGrade")
    @ResponseBody
    public Result deleGrade(@RequestBody String id){
        if (id==null){
            return new Result(201,"删除操作需要传入id","");
        }
        boolean isSave = tbVipService.removeById(Integer.valueOf(id.replace("id=", "")));
        if (isSave){
            return new Result(200,"删除成功","");
        }else {
            return new Result(202,"删除失败","");
        }
    }


    /**
     * 根据id查询vip等级
     * @return
     */
    // @RequiresPermissions("sys:vipUser:getGradeAll")
    @PostMapping("getGradeById")
    @ResponseBody
    public TbVip getGradeById(@RequestBody Map<String, String> id){
        TbVip tbVip = tbVipService.getOne(new QueryWrapper<TbVip>().eq("id", Integer.valueOf(id.get("id"))));

        return tbVip;
    }

    /**
     * 查询所有vip等级
     * @return
     */
    @RequiresPermissions("sys:vip:list")
    @PostMapping("getGradeAll")
    @ResponseBody
    public PageData<TbVip> getGradeAll(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                       @RequestParam(value = "limit",defaultValue = "10")Integer limit){
        PageData<TbVip> userPageData = new PageData<>();
        QueryWrapper<TbVip> tbVipQueryWrapper = new QueryWrapper<TbVip>().ne("vip_rank", "代理");
        IPage<TbVip> userPage = tbVipService.page(new Page<>(page,limit),tbVipQueryWrapper);
        userPageData.setCount(userPage.getTotal());
        userPageData.setData(userPage.getRecords());
        return userPageData;
    }
}
