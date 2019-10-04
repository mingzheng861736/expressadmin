package com.zfl.service;

import com.zfl.entity.TbOddNum;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zfl.entity.vo.QueryVo;
import com.zfl.result.Result;

import java.util.List;

/**
 * <p>
 * 收单  订单表 服务类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
public interface TbOddNumService extends IService<TbOddNum> {

    public List<TbOddNum> getAllByCondition(QueryVo queryVo);

    List<TbOddNum> getOrderByCondition(QueryVo<TbOddNum> queryVo);

    Result getOrderNum ();

}
