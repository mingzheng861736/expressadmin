package com.xiaoshu.admin.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.TbDraw;
import com.baomidou.mybatisplus.extension.service.IService;


/**
 * <p>
 * 提现表 服务类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
public interface TbDrawService extends IService<TbDraw> {

    IPage<TbDraw> pageList(Page page, QueryWrapper queryWrapper);

}
