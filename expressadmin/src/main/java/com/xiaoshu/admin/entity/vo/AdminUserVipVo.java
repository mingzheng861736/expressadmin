package com.xiaoshu.admin.entity.vo;

import com.xiaoshu.admin.entity.AdminUser;
import com.xiaoshu.admin.entity.TbArea;
import com.xiaoshu.admin.entity.TbVip;
import lombok.Data;

/**
 * @program: expressadmin->AdminUserVipVo
 * @description: 用户会员视图渲染对象
 * @author: zc
 * @create: 2019-09-03 10:07
 **/
@Data
public class AdminUserVipVo extends AdminUser {

    private TbVip tbVip;

    private TbArea tbArea;

}
