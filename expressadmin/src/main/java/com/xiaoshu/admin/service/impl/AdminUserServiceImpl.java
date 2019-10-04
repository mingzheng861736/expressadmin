package com.xiaoshu.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.mapper.AdminUserMapper;
import com.xiaoshu.admin.service.AdminUserService;
import org.springframework.stereotype.Service;

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

}
