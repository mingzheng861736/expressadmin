package com.zfl.controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminUser;
import com.zfl.entity.AdminUserRole;
import com.zfl.entity.vo.RegisterBean;
import com.zfl.entity.vo.UserBean;
import com.zfl.result.Result;
import com.zfl.service.AdminUserRoleService;
import com.zfl.service.AdminUserService;
import com.zfl.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;
import java.util.UUID;

/**
 * <p>
 *用户登录,注册
 * </p>
 *
 * @author lmz
 * @since 2019-08-29
 */
@RestController
@RequestMapping("adminUser")
public class AdminUserController {
    @Autowired
    AdminUserService adminUserService;
    @Autowired
    AdminUserRoleService adminUserRoleService;

    /**
     * 注册时判断用户名是否存在
     * @param userName
     * @return
     */
    @PostMapping("exist")
    public Result exist(@RequestBody String userName){
        //注册时判断用户名是否存在
        QueryWrapper<AdminUser> qw =new QueryWrapper<>();
        qw.eq("account",userName);
        //根据账户名查询,如果能查到数据,说明用户名已存在
        AdminUser user=adminUserService.getOne(qw);
        if(user!=null){
            return new Result(201,"用户名已经存在","");
        }else {
            return new Result(200,"用户名可以使用","");
        }
    }

    /**
     * 处理用户的注册请求
     * @return
     */
    @PostMapping("adminUserRegister")
    public Result userRegister(@RequestBody RegisterBean registerBean){
        // 生成盐值
        String salt = UUID.randomUUID().toString().replace("-", "").trim();
        //用户密码md5加密
        String uPassMd5 =Md5Util.md532(registerBean.getPass());
        //生成的md5加密加盐值再次加密
        String passMd5 =Md5Util.md532(uPassMd5+salt);
        //转换成AdminUser对象
        AdminUser adminUser = transition(registerBean);
        //添加盐值
        adminUser.setUserSalt(salt);
        //添加md5密码
        adminUser.setPass(passMd5);
        //添加状态 状态 false未启用true启用
        adminUser.setStatus(true);
        //获取邀请码
        String invite = invite();
        adminUser.setUserInviteCode(invite);
        //保存到数据库
        boolean save=adminUserService.save(adminUser);
        if (save){
            //如果成功,用户角色关联表添加对应数据
            QueryWrapper<AdminUser> queryWrapper=new QueryWrapper<>();
            queryWrapper.eq("account",adminUser.getAccount());
            AdminUser adminUser1=adminUserService.getOne(queryWrapper);
            //创建用户角色关联表对象
            AdminUserRole adminUserRole=new AdminUserRole();
            //添加对应数据
            adminUserRole.setUserId(adminUser1.getId());
            adminUserRole.setRoleId(registerBean.getRole());
            //插入数据库
            adminUserRoleService.save(adminUserRole);
            return new Result(200,"注册成功","");
        }else {
            return new Result(201,"注册失败","");
        }
    }

    /**
     * 处理登录请求
     */
    @PostMapping("login")
    public Result login(@RequestBody UserBean userBean) {
        //校验参数
        userBean.validateParams();
        //根据用户账户获得用户对象
        QueryWrapper<AdminUser> qw=new QueryWrapper<>();
        qw.eq("account",userBean.getUserName());
        AdminUser adminUser =adminUserService.getOne(qw);
        //如果没有查到对象,返回用户名错误
        if(adminUser==null){
            return new Result(201,"登录失败，账号或密码错误","");
        }
        //用传来的密码md5加密
        String uPassMd5=Md5Util.md532(userBean.getPassWord());
        //uPassMd5加上数据库盐值再次加密
        String passMd5 =Md5Util.md532(uPassMd5+adminUser.getUserSalt());
        //与数据库的md5密码比较,如果相等,登录成功,反之失败
        if(adminUser.getPass().equals(passMd5)&& adminUser.getStatus()==true){
            return new Result(200,"登录成功","");
        }else {
            return new Result(201,"登录失败，账号或密码错误","");
        }
    }
    /**
     * 用户的修改
     */
    @PostMapping("update")
    public Result update(@RequestBody RegisterBean registerBean){
        //根据id修改
        if(registerBean.getId()==null){
            return new Result(202,"请使用用户id更新","");
        }
        //转化对象
        AdminUser adminUser = transition(registerBean);
        adminUser.setId(registerBean.getId());
        adminUser.setStatus(registerBean.getStatus());
        //根据id修改对象
        boolean b = adminUserService.updateById(adminUser);

        //创建用户角色关联表对象
        AdminUserRole adminUserRole = new AdminUserRole();
        adminUserRole.setRoleId(registerBean.getRole());
        QueryWrapper<AdminUserRole> queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_id",registerBean.getId());
        //修改用户角色关联表数据
        boolean a =adminUserRoleService.update(adminUserRole,queryWrapper);
        if (b==true && a==true){
            return new Result(200,"更新成功",adminUser);
        }else {
            return new Result(201,"更新失败",adminUser);
        }

    }

    /**
     * 用户的删除
     * @param
     * @return
     */
    @PostMapping("dele")
    public Result dele(@RequestBody String id){
        //删除用户
        boolean a = adminUserService.removeById(id);
        //构建删除条件
        QueryWrapper<AdminUserRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",id);
        //删除用户角色关联表数据
        boolean b = adminUserRoleService.remove(queryWrapper);
        if (b==true && a==true){
            return new Result(200,"删除成功","");
        }else {
            return new Result(201,"删除失败","");
        }
    }

    /**
     * 用户查询,根据账号查询
     * @param
     * @return
     */
    @PostMapping("selectByName")
    public Result selectByName(@RequestBody String account){
        QueryWrapper<AdminUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("account",account);
          AdminUser adminUser = adminUserService.getOne(queryWrapper);
          if(adminUser!=null){
              return new Result(200,"请求成功",adminUser);
          }else {
              return new Result(201,"请求失败","");
          }
     }

    /**
     * 修改密码
     * @param
     * @return
     */
    @PostMapping("changePassWord")
    public Result changePassWord(@RequestBody UserBean userBean){
        //生成盐值
        String salt = UUID.randomUUID().toString().replace("-", "").trim();
        //新密码md5加密
        String uPassMd5 =Md5Util.md532(userBean.getPassWord());
        //加盐值再次加密
        String passMd5 = Md5Util.md532(uPassMd5+salt);
        //根据用户名查询用户对象
        QueryWrapper<AdminUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("account",userBean.getUserName());
        AdminUser adminUser=adminUserService.getOne(queryWrapper);
        //添加新密码
        adminUser.setPass(passMd5);
        //添加盐值
        adminUser.setUserSalt(salt);
        //更新
        boolean b = adminUserService.updateById(adminUser);
        if(b){
            return new Result(200,"修改成功",adminUser);
        }else {
            return new Result(201,"修改失败","");
        }

    }

    //转换
    public AdminUser transition(RegisterBean registerBean){
        AdminUser adminUser = new AdminUser();
        adminUser.setAccount(registerBean.getAccount());
        adminUser.setName(registerBean.getName());
        adminUser.setSoftDelete(registerBean.getSoftDelete());
        adminUser.setUpdatePerson(registerBean.getUpdatePerson());
        adminUser.setUpdateTime(registerBean.getUpdateTime());
        adminUser.setDeletePerson(registerBean.getDeletePerson());
        adminUser.setDeleteTime(registerBean.getDeleteTime());
        adminUser.setCreatePerson(registerBean.getCreatePerson());
        adminUser.setCreateTime(registerBean.getCreateTime());
        adminUser.setUserVip(registerBean.getUserVip());
        adminUser.setUserArea(registerBean.getUserArea());
        return adminUser;
    }

    //生成邀请码
    public String invite(){
        while (true){
            //生成6位随机数
            int  maxNum = 62;
            int i;
            int count = 0;
            char[] str = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
                    'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
                    'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ,
                    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
                    'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
                    'x', 'y', 'z'};
            StringBuffer pwd = new StringBuffer("");
            Random r = new Random();
            while(count < 6){
                i = Math.abs(r.nextInt(maxNum));
                if (i >= 0 && i < str.length) {
                    pwd.append(str[i]);
                    count ++;
                }
            }
            QueryWrapper<AdminUser> qwSelect = new QueryWrapper<>();
            qwSelect.eq("user_invite_code",pwd.toString());
            AdminUser adminUser= adminUserService.getOne(qwSelect);
            if(adminUser==null){
                return pwd.toString();
            }
        }

        }
}