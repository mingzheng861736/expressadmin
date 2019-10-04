package com.zfl.service;

import com.zfl.entity.AdminUser;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zfl.entity.vo.ReceivingAppUserLogin;
import com.zfl.entity.vo.UserRegisterVo;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
public interface AdminUserService extends IService<AdminUser> {

    /**
    * @Description: 注册用户
    * @Param:
    * @return:
    * @Author: zc
    * @Date: 2019/9/4 11:05
    */

    Boolean registerUser(UserRegisterVo userRegisterVo);

}
