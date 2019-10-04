package com.zfl.entity.receivingappentity;

import com.zfl.entity.SupperEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @program: express->Decliver
 * @description: 前端发货对象
 * @author: zc
 * @create: 2019-08-29 11:06
 **/
@Data
@EqualsAndHashCode(callSuper=false)
public class Decliver extends SupperEntity {


    /**
     * @Description: 发货地址
     * @Param:
     * @return:
     * @Author: zc
     * @Date: 2019/8/29 11:15
     */
    @NotBlank(message = "发货地址不能为空")
    private String senAddress;


    /**
     * @Description: //收货地址
     * @Param:
     * @return:
     * @Author: zc
     * @Date: 2019/8/29 11:15
     */
    @NotBlank(message = "收货地址不能为空")
    private String recipients;



    /**
     * @Description: //物品信息
     * @Param:
     * @return:
     * @Author: zc
     * @Date: 2019/8/29 11:15
     */
    @NotBlank(message = "物品信息不能为空")
    private String goodInfo;

    /**
    * @Description: 寄件方式
    * @Param:
    * @return:
    * @Author: zc
    * @Date: 2019/8/29 11:15
    */
    @NotNull(message = "寄件方式不能为空")
    private Integer senderType;


    /**
     * @Description: //取货方式
     * @Param:
     * @return:
     * @Author: zc
     * @Date: 2019/8/29 11:15
     */
    @NotNull(message = "取货方式不能为空")
    private Integer modeOfDespatch;

    @NotBlank(message = "支付类型不能为空")
    private String payType;

    /**
     * @Description:  //备注
     * @Param:
     * @return:
     * @Author: zc
     * @Date: 2019/8/29 11:15
     */
    private String remarks;

    /**
     * @Description: 发货区域
     * @Param:
     * @return:
     * @Author: zc
     * @Date: 2019/8/29 14:59
     */
    @NotBlank(message = "发货区域不能为空")
    private String orderArea;

    /**
     * @Description: 物品类型
     * @Param:
     * @return:
     * @Author: zc
     * @Date: 2019/8/29 14:59
     */
    @NotBlank(message = "物品类型不能为空")
    private String stdmode;


}
