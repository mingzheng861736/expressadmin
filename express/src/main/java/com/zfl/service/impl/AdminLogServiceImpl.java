package com.zfl.service.impl;

import com.zfl.entity.AdminLog;
import com.zfl.mapper.AdminLogMapper;
import com.zfl.service.AdminLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户操作日志表 服务实现类
 * </p>
 *
 * @author zc
 * @since 2019-08-29
 */
@Service
public class AdminLogServiceImpl extends ServiceImpl<AdminLogMapper, AdminLog> implements AdminLogService {

}
