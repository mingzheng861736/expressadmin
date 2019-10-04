package com.zfl.entity.vo;

import com.zfl.entity.SupperEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class ApplicationAgency extends SupperEntity {

    @NotBlank(message = "姓名不能为空！")
    private String userName;
    @NotBlank(message = "电话不能为空！")
    private String userPhone;
    @NotBlank(message = "身份证号不能为空！")
    private String userCard;
    @NotBlank(message = "理由不能为空！")
    private String reason;
    @NotBlank(message = "区域不能为空！")
    private String area;

}
