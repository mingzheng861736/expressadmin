package com.xiaoshu.admin.controller.integralShoppingMall;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.TbGoods;
import com.xiaoshu.admin.service.AdminUserService;
import com.xiaoshu.admin.service.TbGoodsService;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@Controller
@RequestMapping("/admin/goods")
public class GoodsController {
    @Autowired
    TbGoodsService goodsService;
    @Autowired
    AdminUserService adminUserService;
    @RequestMapping("/list")
    public String list(){
        return "admin/goods/goodsList";
    }

    @RequestMapping("/goodsList")
    @ResponseBody
    public PageData<TbGoods> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                  @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                                  String goodsName) {

        PageData<TbGoods> userPageData = new PageData<>();
        if(goodsName==null||goodsName.equals("")){
            IPage<TbGoods> userPage = goodsService.page(new Page<>(page, limit), null);
            userPageData.setCount(userPage.getTotal());
            userPageData.setData(userPage.getRecords());
        }else {
            QueryWrapper qw =  new QueryWrapper();
            qw.like("goods_name",goodsName);
            IPage<TbGoods> userPage = goodsService.page(new Page<>(page, limit), qw);
            userPageData.setCount(userPage.getTotal());
            userPageData.setData(userPage.getRecords());
        }
        return userPageData;
    }
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity delete(@RequestParam(value = "id",required = false)String id){
        if(StringUtils.isBlank(id)){
            return ResponseEntity.failure("ID不能为空");
        }
       TbGoods tbGoods  = goodsService.getById(id);
        if(tbGoods.getIsPutaway()==1){
            return ResponseEntity.failure("商品未下架不能删除");
        }
        boolean b=goodsService.removeById(Integer.valueOf(id));
        if(b){
            return ResponseEntity.success("操作成功");
        }else {
            return ResponseEntity.failure("删除失败");
        }
    }
    @RequestMapping("/add")
    public String add(){
        return "admin/goods/goodsAdd";
    }
    @PostMapping("/postAdd")
    @ResponseBody
    public ResponseEntity add(TbGoods goods) {
        if (StringUtils.isBlank(goods.getGoodsName())) {
            return ResponseEntity.failure("商品名称不能为空");
        }
        if (goods.getGoodsPrice() == null) {
            return ResponseEntity.failure("商品价格不能为空");
        }
        if (goods.getIsPutaway() == null) {
            return ResponseEntity.failure("商品状态不能为空");
        }
        goods.setCreateTime(new Date());//创建时间
        boolean b = goodsService.save(goods);
        if (b) {
            return ResponseEntity.success("操作成功");
        } else {
            return ResponseEntity.failure("操作失败");
        }
    }
    @GetMapping("/edit")
    public String edit(String id, ModelMap modelMap){
       TbGoods goods = goodsService.getById(id);
        modelMap.addAttribute("goods",goods);
        return "admin/goods/goodsEdit";
    }

    @PostMapping("/edit")
    @ResponseBody
    public ResponseEntity edit(TbGoods goods){
        goods.setUpdateTime(new Date());
       boolean b =goodsService.updateById(goods);
       if(b){
           return ResponseEntity.success("操作成功");
       }else {
           return ResponseEntity.failure("操作失败");
       }
    }
}