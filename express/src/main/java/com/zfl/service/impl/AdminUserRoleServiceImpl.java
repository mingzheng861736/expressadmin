package com.zfl.service.impl;

import com.zfl.entity.AdminUserRole;
import com.zfl.mapper.AdminUserRoleMapper;
import com.zfl.service.AdminUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户与角色关联表 服务实现类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Service
public class AdminUserRoleServiceImpl extends ServiceImpl<AdminUserRoleMapper, AdminUserRole> implements AdminUserRoleService {

}
