package com.xiaoshu.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoshu.admin.entity.TbDraw;
import com.xiaoshu.admin.mapper.TbDrawMapper;
import com.xiaoshu.admin.service.TbDrawService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 提现表 服务实现类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Service
public class TbDrawServiceImpl extends ServiceImpl<TbDrawMapper, TbDraw> implements TbDrawService {

    @Autowired
    private  TbDrawMapper tbDrawMapper;

    @Override
    public IPage<TbDraw> pageList(Page page, QueryWrapper queryWrapper) {
        IPage iPage = tbDrawMapper.selectPage(page, queryWrapper);
        return iPage;
    }
}
