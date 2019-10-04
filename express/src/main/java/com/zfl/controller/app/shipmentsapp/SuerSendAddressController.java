package com.zfl.controller.app.shipmentsapp;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.controller.TbStdmodeController;
import com.zfl.entity.AdminUser;
import com.zfl.entity.TbStdmode;
import com.zfl.entity.TbUserSendAddress;
import com.zfl.jwt.UserJwtService;
import com.zfl.note.MyLog;
import com.zfl.result.Result;
import com.zfl.service.TbStdmodeService;
import com.zfl.service.TbUserSendAddressService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author sunzhenpeng
 * @data 2019/9/10
 * @description 收货地址
 */
@RestController
@RequestMapping("/suerSendAddress")
public class SuerSendAddressController {

    @Autowired
    private TbUserSendAddressService tbUserSendAddressService;

    @Autowired
    private TbStdmodeService tbStdmodeService;

    @Autowired
    private UserJwtService userJwtService;

    /**
     * 查询返回用户地址
     * @author sunzhenpeng
     * @date 2019/9/10
     * @return com.zfl.result.Result
     */
    @MyLog(value = "查询用户地址")
    @PostMapping("/getAddressList")
    @RequiresAuthentication
    @ResponseBody
    public Result getAddressList(HttpServletRequest request){
        Integer userId = userJwtService.getUserId();
        //根据用户Id查询用户地址
       List<TbUserSendAddress> addressList = tbUserSendAddressService.list(new QueryWrapper<TbUserSendAddress>().eq("user_id",userId));
        if(addressList==null||addressList.size()==0){
            return new Result(201,"您还没有保存地址！","");
        }
        return new Result(200,"查询成功",addressList);
    }

    /**
     *添加用户地址
     * @author sunzhenpeng
     * @date 2019/9/10
     * @param tbUserSendAddress
     * @return com.zfl.result.Result
     */
    @MyLog(value = "添加、编辑、删除用户地址")
    @PostMapping("/addEditDelAddress")
    @RequiresAuthentication
    public Result addAddress (@RequestBody TbUserSendAddress tbUserSendAddress, @RequestParam String oper){
        tbUserSendAddress.setUserId(userJwtService.getUserId());
        //设置默认地址
        if(!oper.equals("2")&&tbUserSendAddress.getIsDefault().equals("1")){
            //根据用户Id查询用户地址
            List<TbUserSendAddress> addressList = tbUserSendAddressService.list(new QueryWrapper<TbUserSendAddress>().eq("user_id",tbUserSendAddress.getUserId()));
            addressList.forEach(add->{
                if(add.getIsDefault().equals("1")){
                    add.setIsDefault("0");
                    tbUserSendAddressService.updateById(add);
                }
            });
        }
        //判断为哪种操作 oper 0为添加、1为编辑、2为删除
         if(oper.equals("0")){// 0为添加
            boolean save = tbUserSendAddressService.save(tbUserSendAddress);
            if(!save){
                return new Result(201,"添加失败！","");
            }
        }else if(oper.equals("1")){//1为编辑
            boolean edit = tbUserSendAddressService.updateById(tbUserSendAddress);
            if(!edit){
                return new Result(201,"编辑失败！","");
            }
        }else if(oper.equals("2")){//2为删除
            boolean del = tbUserSendAddressService.removeById(tbUserSendAddress.getId());
            if(!del){
                return new Result(201,"删除失败！","");
            }
        }
        return new Result(200,"操作成功！","");
    }

    @PostMapping("/getAddressById")
    @RequiresAuthentication
    @ResponseBody
    public Result getAddressById(HttpServletRequest request,@RequestParam int id){
        //根据用户Id查询用户地址
        TbUserSendAddress address = tbUserSendAddressService.getById(id);
        if(address==null){
            return new Result(201,"此地址不存在","");
        }
        return new Result(200,"查询成功",address);
    }

    /**
     *设置默认地址
     * @author sunzhenpeng
     * @date 2019/9/12
     * @param id
     * @return void
     */
    public void setDefault(int id){
        Integer userId = userJwtService.getUserId();
        //根据用户Id查询用户地址
        List<TbUserSendAddress> addressList = tbUserSendAddressService.list(new QueryWrapper<TbUserSendAddress>().eq("user_id",userId));
        addressList.forEach(add->{
            add.setIsDefault("0");
            if(add.getId()==id)add.setIsDefault("1");
            tbUserSendAddressService.save(add);
        });
    }

    /**
     *查询物品分类
     * @author sunzhenpeng
     * @date 2019/9/10
     * @return com.zfl.result.Result
     */
    @PostMapping("/getStdmode")
    @RequiresAuthentication
    public Result getStdmode(){
        List<TbStdmode> list = tbStdmodeService.list();
        return new Result(200,"操作成功！",list);
    }

    /**
     * 修改默认地址
     */
    @PostMapping("defaultAddress")
    public Result defaultAddress( @RequestBody String id){
        AdminUser adminUser = userJwtService.getUser();
        QueryWrapper<TbUserSendAddress> qw = new QueryWrapper<>();
        qw.eq("user_id",adminUser.getId());
        TbUserSendAddress address = new TbUserSendAddress();
        address.setIsDefault("0");
        boolean b =tbUserSendAddressService.update(address,qw);
        TbUserSendAddress tAddress = new TbUserSendAddress();
        tAddress.setId(Integer.valueOf(id));
        tAddress.setIsDefault("1");
        tbUserSendAddressService.updateById(tAddress);
        return new Result(200,"更新成功","");
    }


}
