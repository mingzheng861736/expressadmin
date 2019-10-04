package com.zfl.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zfl.entity.TbDraw;
import com.zfl.entity.vo.QueryVo;
import com.zfl.result.Result;
import com.zfl.service.TbDrawService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("admin")
public class DrawController {

    @Autowired
    private TbDrawService tbDrawService;


    /**
     * 添加提现
     * @param tbDraw
     * @return
     */

    @PostMapping("addDraw")
    public Result addDraw(@RequestBody TbDraw tbDraw){
        tbDraw.validateParams();
        boolean isSave = tbDrawService.save(tbDraw);
        if (isSave){
            return new Result(200,"添加成功",tbDraw);
        }else {
            return new Result(201,"添加失败",tbDraw);
        }
    }


    /**
     * 查询所有提现记录
     * @return
     */
    @PostMapping("getDrawAll")
    public Result getDrawAll( @RequestBody QueryVo queryVo){
        PageHelper.startPage(queryVo.getPageNo(),queryVo.getPageSize(),true);
        List<TbDraw> list = tbDrawService.list();
        PageInfo<TbDraw> pageInfo = new PageInfo<TbDraw>(list);
        return new Result(200,"查询成功",pageInfo);
    }



    /**
     * 提现记录修改（提现审核）
     * @param tbDraw
     * @return
     */
    @PostMapping("updateDraw")
    public Result updateDraw(@RequestBody TbDraw tbDraw){
        tbDraw.validateParams();
        if (tbDraw.getId()==null){
            return new Result(201,"更新操作需要传入id","");
        }
        boolean isSave = tbDrawService.updateById(tbDraw);
        if (isSave){
            return new Result(200,"更新成功",tbDraw);
        }else {
            return new Result(202,"更新失败",tbDraw);
        }
    }


}
