package com.xiaoshu.admin.controller.payTypeController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.entity.TbOddNum;
import com.xiaoshu.admin.entity.TbPayType;
import com.xiaoshu.admin.service.TbOddNumService;
import com.xiaoshu.admin.service.TbPayTypeService;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/pay")
public class payTypeController {
    @Autowired
    TbPayTypeService payTypeService;

    @Autowired
    TbOddNumService oddNumService;

    @RequestMapping("/payType")
    public String list(){
        return "admin/payType/payType";
    }

    @RequestMapping("/payTypeList")
    @ResponseBody
    public PageData<TbPayType> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                 @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                                 String payType) {
        PageData<TbPayType> userPageData = new PageData<>();
        if(payType==null||payType.equals("")){
            IPage<TbPayType> userPage = payTypeService.page(new Page<>(page, limit), null);
            userPageData.setCount(userPage.getTotal());
            userPageData.setData(userPage.getRecords());
        }else {
            QueryWrapper qw =  new QueryWrapper();
            qw.like("pay_type",payType);
            IPage<TbPayType> userPage = payTypeService.page(new Page<>(page, limit), qw);
            userPageData.setCount(userPage.getTotal());
            userPageData.setData(userPage.getRecords());
        }
        return userPageData;
    }

    @RequestMapping("/edit")
    public String edit(String id, ModelMap modelMap){
        TbPayType payType = payTypeService.getById(id);
        modelMap.addAttribute("payType",payType);
        return "admin/payType/edit";
    }

    @PostMapping("/edit")
    @ResponseBody
    public ResponseEntity edit(TbPayType payType){

        if (StringUtils.isBlank(payType.getPayCode())) {
            return ResponseEntity.failure("支付code不能为空");
        }
        if (StringUtils.isBlank(payType.getPayType())) {
            return ResponseEntity.failure("支付类型不能为空");
        }
        if (StringUtils.isBlank(payType.getPaySetting())) {
            return ResponseEntity.failure("支付方式配置不能为空");
        }
        payTypeService.updateById(payType);
        return ResponseEntity.success("操作成功");
    }

    @RequestMapping("/add")
    public String add(){
        return "admin/payType/add";
    }

   // @PostMapping("/payAdd")
    @RequestMapping("/payAdd")
    @ResponseBody
    public ResponseEntity add(TbPayType payType){
        if(StringUtils.isBlank(payType.getPayCode())){
            return ResponseEntity.failure("支付code不能为空");
        }
        if(StringUtils.isBlank(payType.getPayType())){
            return ResponseEntity.failure("支付类型不能为空");
        }
        if(StringUtils.isBlank(payType.getPaySetting())){
            return ResponseEntity.failure("支付方式配置不能为空");
        }


        QueryWrapper<TbPayType> qw = new QueryWrapper();
        qw.eq("pay_type",payType.getPayType());
        TbPayType tbPayType = payTypeService.getOne(qw);
        if(tbPayType!=null){
            return ResponseEntity.failure("支付类型已存在");
        }
        boolean b=  payTypeService.save(payType);
        return ResponseEntity.success("操作成功");
    }
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity delete(@RequestParam(value = "id",required = false)String id){
        if(StringUtils.isBlank(id)){
            return ResponseEntity.failure("ID不能为空");
        }
        //判断该区域在订单表是否有引用
        QueryWrapper<TbOddNum> qwOdd = new QueryWrapper<>();
        qwOdd.eq("order_area",id);
        List<TbOddNum> oddNumList = oddNumService.list(qwOdd);
        if(oddNumList.size()!=0){
            return ResponseEntity.failure("该数据被引用,不能被删除!");
        }
        boolean b=payTypeService.removeById(Integer.valueOf(id));
        if(b){
            return ResponseEntity.success("操作成功");
        }else {
            return ResponseEntity.failure("删除失败");
        }
    }

}
