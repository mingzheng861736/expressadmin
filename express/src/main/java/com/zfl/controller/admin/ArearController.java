package com.zfl.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.TbArea;
import com.zfl.result.Result;
import com.zfl.service.TbAreaService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 *
 */
@RestController
@RequestMapping("admin")
public class ArearController {

    @Autowired
    private TbAreaService tbAreaService;

    /**
     * 区域添加
     * @param tbArea
     * @return
     */
    @PostMapping("addArea")
    public Result addArea(@RequestBody TbArea tbArea){
        tbArea.validateParams();
        boolean isSave = tbAreaService.save(tbArea);
        if (isSave){
            return new Result(200,"添加成功",tbArea);
        }else {
            return new Result(201,"添加失败",tbArea);
        }
    }

    /**
     * 区域修改
     * @param tbArea
     * @return
     */
    @PostMapping("updateArea")
    public Result updateArea(@RequestBody TbArea tbArea){
        tbArea.validateParams();
        if (tbArea.getId()==null){
            return new Result(201,"更新操作需要传入id","");
        }
        boolean isSave = tbAreaService.updateById(tbArea);
        if (isSave){
            return new Result(200,"更新成功",tbArea);
        }else {
            return new Result(202,"更新失败",tbArea);
        }
    }

    /**
     * 区域删除
     * @param id
     * @return
     */
    @PostMapping("deleArea")
    public Result deleArea(@RequestBody String id){
        if (id==null){
            return new Result(201,"删除操作需要传入id","");
        }
        boolean isSave = tbAreaService.removeById(id);
        if (isSave){
            return new Result(200,"删除成功","");
        }else {
            return new Result(202,"删除失败","");
        }
    }

    /**
     * 查询所有区域
     * @return
     */
    @PostMapping("getAreaAll")
    public Result getAreaAll(){
        List<TbArea> list = tbAreaService.list();
        return new Result(200,"查询成功",list);
    }

    /**
     * 根据区域名称查询
     * @param areaName
     * @return
     */
    @PostMapping("getAreaByName")
    public Result getAreaAll(@RequestBody String areaName){
        if (StringUtils.isBlank(areaName)){
            return new Result(201,"查询区域名称不能为空","");
        }
        List<TbArea> list = tbAreaService.list(new QueryWrapper<TbArea>()
                .like("area_name",areaName));
        return new Result(200,"查询成功",list);
    }
}
