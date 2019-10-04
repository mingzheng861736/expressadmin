package com.zfl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zfl.entity.TbDraw;
import com.zfl.mapper.TbDrawMapper;
import com.zfl.service.TbDrawService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
