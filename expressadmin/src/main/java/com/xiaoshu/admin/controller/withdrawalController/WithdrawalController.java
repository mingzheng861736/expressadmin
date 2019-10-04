package com.xiaoshu.admin.controller.withdrawalController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.entity.TbDraw;
import com.xiaoshu.admin.entity.TbFundInfo;
import com.xiaoshu.admin.service.AdminUserService;
import com.xiaoshu.admin.service.TbDrawService;
import com.xiaoshu.admin.service.TbFundInfoService;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("admin/draw")
public class WithdrawalController {

    @Autowired
    private TbDrawService tbDrawService;
    @Autowired
    private AdminUserService adminUserService;
    @Autowired
    private TbFundInfoService tbFundInfoService;


    @GetMapping("drawList")
    @SysLog("跳转提现列表页面")
    public String list(){
        return "admin/draw/drawList";
    }

    @GetMapping("update")
    @SysLog("跳转提现审核页面")
    public String showUpdate(Model model, String id) {
        TbDraw tbDraw = tbDrawService.getById(id);
        tbDraw.setAdminUser(adminUserService.getById(tbDraw.getDrawUserId()));
        model.addAttribute("tbDraw",tbDraw);
        return "admin/draw/drawUpdate";
    }


    /**
     * 查询提现列表
     * @param page
     * @param limit
     * @param searchName
     * @param status
     * @return
     */
    @RequiresPermissions("sys:draw:list")
    @PostMapping("getDrawAll")
    @ResponseBody
    public PageData<TbDraw> getDrawAll(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                       @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                       String searchName, Integer status ){

        PageData<TbDraw> userPageData = new PageData<>();
        QueryWrapper<TbDraw> tbVipQueryWrapper = new QueryWrapper<TbDraw>();
        if (StringUtils.isBlank(searchName) && status != null) {
              tbVipQueryWrapper.eq("draw_statu",status);
        }else
        if (StringUtils.isNotBlank(searchName) && status == null) {
          AdminUser one = adminUserService.getOne(new QueryWrapper<AdminUser>().like("account", searchName));
             tbVipQueryWrapper.eq("draw_user_id",one.getId());
        }else
        if (StringUtils.isNotBlank(searchName) && status != null) {
          AdminUser one = adminUserService.getOne(new QueryWrapper<AdminUser>().like("account", searchName));
             tbVipQueryWrapper.eq("draw_user_id",one.getId())
                              .and(wapper -> wapper.eq("draw_statu",status));
        }
        IPage<TbDraw> userPage = tbDrawService.page(new Page<>(page,limit),tbVipQueryWrapper);
        userPageData.setCount(userPage.getTotal());
        List<TbDraw> tbDrawList = userPage.getRecords();
        for (TbDraw tbDraw : tbDrawList) {
            Integer userId = tbDraw.getDrawUserId();
            AdminUser byId = adminUserService.getById(userId);
            tbDraw.setDrawPassUser(byId.getAccount());
        }
        userPageData.setData(tbDrawList);
        return userPageData;
    }


    /**
     * 提现审核
     * @param tbDraw
     * @return
     */

    @RequiresPermissions("sys:draw:updateDraw")
    @PostMapping(value = "updateDraw")
    @ResponseBody
    public ResponseEntity updateDraw(TbDraw tbDraw){
        tbDraw.validateParams();
        if (tbDraw.getId()==null){
            return ResponseEntity.failure("更新操作需要传入id");
        }
        TbDraw byId = tbDrawService.getById(tbDraw.getId());
        if (byId.getDrawStatu()==1){
            return ResponseEntity.failure("不能重复审核");
        }
        tbDraw.setDrawUpdateTime(new Date());
        boolean isSave = tbDrawService.updateById(tbDraw);
        if (isSave){
            TbFundInfo tbFundInfo = new TbFundInfo();
            tbFundInfo.setUserId(byId.getDrawUserId());
            tbFundInfo.setFundType(0);
            tbFundInfo.setMoney(byId.getDrawPrice());
            tbFundInfo.setMoneyPurpose(0);
            boolean save = tbFundInfoService.save(tbFundInfo);
            //减去用户余额
            AdminUser user = adminUserService.getById(byId.getDrawUserId());
            double remainingSum = user.getRemainingSum()-byId.getDrawPrice();
            user.setRemainingSum(remainingSum);
            boolean userSave = adminUserService.updateById(user);
            if (save&&userSave){
                return ResponseEntity.success("审核成功！");
            }
            return ResponseEntity.failure("审核失败！");
        }else {
            return ResponseEntity.failure("审核失败！");
        }
    }
}
