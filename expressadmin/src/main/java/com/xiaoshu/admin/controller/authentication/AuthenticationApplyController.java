package com.xiaoshu.admin.controller.authentication;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.entity.TbUserInfo;
import com.xiaoshu.admin.service.AdminUserService;
import com.xiaoshu.admin.service.TbAreaService;
import com.xiaoshu.admin.service.TbUserInfoService;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author sunzhenpeng
 * @data 2019/9/23
 * @description 认证管理 控制器
 */
@Controller
@RequestMapping("/authenticationApply")
public class AuthenticationApplyController {

    @Autowired
    private TbUserInfoService tbUserInfoService;

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private TbAreaService tbAreaService;

    /**
     *认证申请列表入口
     * @author sunzhenpeng
     * @date 2019/9/23
     * @return java.lang.String
     */
    @RequestMapping("/inlet")
    public String list(){
        return "admin/authentication/authenticationApplyList";
    }

    @RequestMapping("/applyList")
    @ResponseBody
    public PageData<AdminUser> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                    @RequestParam(value = "limit", defaultValue = "10") Integer limit, String startDate, String endDate,
                                    AdminUser adminUser) {
        List<AdminUser> applylist = new ArrayList<>();
        PageHelper.startPage(page,limit,true);
        QueryWrapper<AdminUser> applyWrapper = new QueryWrapper<>();
        if(startDate!=null&&!startDate.equals(""))applyWrapper.ge("create_time",startDate);//大于等于
        if(endDate!=null&&!endDate.equals(""))applyWrapper.le("create_time",endDate);//小于等于
        applyWrapper.eq("soft_delete",1);//未删除
        List<AdminUser> userList = adminUserService.list(applyWrapper);
        List<TbUserInfo> userInfoList = tbUserInfoService.list(new QueryWrapper<TbUserInfo>().eq("is_certification",2));//认证状态为2的
        userList.forEach(user->{
            userInfoList.forEach(info->{
                if(user.getId()==info.getUserId()){
                    user.setArea(tbAreaService.getById(user.getUserArea()));
                    applylist.add(user);
                }
            });
        });
        PageInfo<AdminUser> pageInfo = new PageInfo<>(applylist);
        pageInfo.getList();
        PageData<AdminUser> applyPageData = new PageData<>();
        applyPageData.setCount(pageInfo.getTotal());
        applyPageData.setData(pageInfo.getList());
        return applyPageData;
    }

    /**
     *认证审核入口
     * @author sunzhenpeng
     * @date 2019/9/24
     * @return java.lang.String
     */
    @RequestMapping("/authenticationInlet")
    public String authenticationInlet(ModelMap model,Integer id){
        Map<String,Object> map = new HashMap<>();
        TbUserInfo tbUserInfo = tbUserInfoService.getOne(new QueryWrapper<TbUserInfo>().eq("user_id",id));
        map.put("imageList",tbUserInfo.getCardNumImage());
        JSONObject userInfo = JSONObject.parseObject(tbUserInfo.getUserInfoJson());
        map.put("userName",userInfo.getString("userName"));
        map.put("userCard",userInfo.getString("userCard"));
        map.put("id",tbUserInfo.getId());
        model.addAttribute("userInfo",map);
        return "admin/authentication/authenticationAudit";
    }

    /**
     *认证审核
     * @author sunzhenpeng
     * @date 2019/9/24
     * @param id
     * @return com.xiaoshu.common.util.ResponseEntity
     */
    @PostMapping("/authenticationAudit")
    @ResponseBody
    public ResponseEntity authenticationAudit( Integer id, ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        TbUserInfo tbUserInfo = tbUserInfoService.getById(id);
        String ss = tbUserInfo.getUserInfoJson();
        JSONObject userInfo = JSONObject.parseObject(tbUserInfo.getUserInfoJson());
        userInfo.put("reason",map.get("auditReason"));
        tbUserInfo.setUserInfoJson(userInfo.toString());
        tbUserInfo.setIsCertification(Integer.parseInt((String)map.get("isCertification")));
        boolean update = tbUserInfoService.updateById(tbUserInfo);
        if(!update){
            return ResponseEntity.success("操作失败");
        }
        return ResponseEntity.success("操作成功");
    }



}
