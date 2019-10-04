package com.zfl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminUser;
import com.zfl.entity.TbRecommend;
import com.zfl.entity.vo.ReceivingAppUserLogin;
import com.zfl.entity.vo.UserRegisterVo;
import com.zfl.exception.GlobalException;
import com.zfl.mapper.AdminUserMapper;
import com.zfl.result.CodeMsg;
import com.zfl.result.Result;
import com.zfl.service.AdminUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zfl.service.TbRecommendService;
import com.zfl.util.Md5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.UUID;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Service("adminUserServiceImpl")
public class AdminUserServiceImpl extends ServiceImpl<AdminUserMapper, AdminUser> implements AdminUserService {

    @Autowired
    private AdminUserMapper adminUserMapper;

    @Autowired
    private TbRecommendService tbRecommendService;

    /**
    * @Description: 用户注册服务
    * @Param: [appUserLogin]
    * @return: java.lang.Boolean
    * @Author: zc
    * @Date: 2019/9/4 11:08
    */
    @Transactional()
    @Override
    public Boolean registerUser(UserRegisterVo userRegisterVo) {
        AdminUser adminUser = new AdminUser();
        TbRecommend tbRecommend = new TbRecommend();
        String md532Str = Md5Util.md532(userRegisterVo.getPassword());
        //生成盐值
        String salt = UUID.randomUUID().toString().replace("-", "").trim();
        String targetPass = Md5Util.md532(md532Str+salt);
        adminUser.setAccount(userRegisterVo.getAccount());
        adminUser.setPass(targetPass);
        adminUser.setUserSalt(salt);
        adminUser.setUserInviteCode(getInviteCode());
        adminUser.setUserArea(userRegisterVo.getArea());
        adminUser.setUserType(0);
        adminUser.setUserVip(1);
        adminUser.setStatus(true);
        int insert = adminUserMapper.insert(adminUser);
        if (insert == 0){
            throw new GlobalException(CodeMsg.REGISTER_ERROR);
        }
        if (StringUtils.isEmpty(userRegisterVo.getInviteCode())){
            //如果邀请码为空直接注册
        }else {
            //如果有邀请码查询邀请人的信息
            AdminUser userInviteCode = adminUserMapper.selectOne(new QueryWrapper<AdminUser>().eq("user_invite_code", userRegisterVo.getInviteCode()));
            if (userInviteCode == null){
                throw new GlobalException(CodeMsg.INVITECODE_ERROR);
            }else {
                tbRecommend.setRecommend(userInviteCode.getId()+"");
                tbRecommend.setRecommended(adminUser.getId()+"");
                tbRecommendService.save(tbRecommend);
            }
        }
        return true;
    }

    /** 
    * @Description: 获取唯一邀请码
    * @Param: [] 
    * @return: java.lang.String 
    * @Author: zc
    * @Date: 2019/9/4 11:27
    */
    private String getInviteCode(){
        String inviteCode = Md5Util.getRandomNum();
        QueryWrapper<AdminUser> qwSelect = new QueryWrapper<>();
        qwSelect.eq("user_invite_code",inviteCode);
        AdminUser detectorUser= adminUserMapper.selectOne(qwSelect);
        if(detectorUser==null){
            return inviteCode;
        }else {
            getInviteCode();
        }
        return inviteCode;
    }
}
