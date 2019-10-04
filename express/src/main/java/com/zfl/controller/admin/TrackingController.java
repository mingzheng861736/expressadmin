package com.zfl.controller.admin;


import com.zfl.entity.TbTracking;
import com.zfl.result.Result;
import com.zfl.service.TbTrackingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("admin")
public class TrackingController {

    @Autowired
    private TbTrackingService tbTrackingService;

    /**
     * 添加快递公司
     * @param tbTracking
     * @return
     */

    @PostMapping("addTracking")
    public Result addTracking(@RequestBody TbTracking tbTracking){
        tbTracking.validateParams();
        boolean isSave = tbTrackingService.save(tbTracking);
        if (isSave){
            return new Result(200,"添加成功",tbTracking);
        }else {
            return new Result(201,"添加失败",tbTracking);
        }
    }

    /**
     * 快递公司修改
     * @param tbTracking
     * @return
     */
    @PostMapping("updateTracking")
    public Result updateTracking(@RequestBody TbTracking tbTracking){
        tbTracking.validateParams();
        if (tbTracking.getId()==null){
            return new Result(201,"更新操作需要传入id","");
        }
        boolean isSave = tbTrackingService.updateById(tbTracking);
        if (isSave){
            return new Result(200,"更新成功",tbTracking);
        }else {
            return new Result(202,"更新失败",tbTracking);
        }
    }


    /**
     * 快递公司删除
     * @param id
     * @return
     */
    @PostMapping("deleTracking")
    public Result deleTracking(@RequestBody String id){
        if (id==null){
            return new Result(201,"删除操作需要传入id","");
        }
        boolean isSave = tbTrackingService.removeById(id);
        if (isSave){
            return new Result(200,"删除成功","");
        }else {
            return new Result(202,"删除失败","");
        }
    }


    /**
     * 查询所有快递公司
     * @return
     */
    @PostMapping("getTrackingAll")
    public Result getTrackingAll(){
        List<TbTracking> list = tbTrackingService.list();
        return new Result(200,"查询成功",list);
    }

}
