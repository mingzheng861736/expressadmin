package com.xiaoshu.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.admin.entity.TbArea;
import com.xiaoshu.admin.entity.TbOddNum;
import com.xiaoshu.admin.entity.TbPayType;
import com.xiaoshu.admin.entity.TbProvinceCityDistrict;
import com.xiaoshu.admin.entity.vo.OrderDetailVo;
import com.xiaoshu.admin.entity.vo.OrderSearchVo;
import com.xiaoshu.admin.mapper.TbOddNumMapper;
import com.xiaoshu.admin.service.*;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
/**
 * <p>
 * 收单  订单表 服务实现类
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@Service
public class TbOddNumServiceImpl extends ServiceImpl<TbOddNumMapper, TbOddNum> implements TbOddNumService {

    @Autowired
    private TbOddNumMapper tbOddNumMapper;

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private TbOddNumService tbOddNumService;

    @Autowired
    private TbPayTypeService tbPayTypeService;

    @Autowired
    private TbAreaService tbAreaService;

    @Autowired
    private TbProvinceCityDistrictService tbProvinceCityDistrictService;

    @Override
    public OrderDetailVo getOrderDetail(TbOddNum tbOddNum) {
        OrderDetailVo orderDetailVo = new OrderDetailVo();
        orderDetailVo.setAddTime(tbOddNum.getAddTime());
        orderDetailVo.setAdminUser(adminUserService.getById(tbOddNum.getId()));
        //获取该订单的收货地址
        String addresser = tbOddNum.getAddresser();
        String adderStr = getAdderStr(addresser);
        orderDetailVo.setSenderInfo(adderStr);
        String recipients = tbOddNum.getRecipients();
        String recipStr = getAdderStr(recipients);
        orderDetailVo.setRecipientsInfo(recipStr);
        orderDetailVo.setAdminUser(adminUserService.getById(tbOddNum.getUserId()));
        orderDetailVo.setTbPayType(tbPayTypeService.getById(tbOddNum.getPayType()));
        orderDetailVo.setId(tbOddNum.getId());
        orderDetailVo.setSysNum(tbOddNum.getSysNum());
        orderDetailVo.setGoodInfo(tbOddNum.getGoodInfo());
        try {
            orderDetailVo.setAddTimes(DateUtils.dateFormat(tbOddNum.getAddTime(),DateUtils.DATE_TIME_PATTERN));
            if (tbOddNum.getPickUpTime() == null){
                orderDetailVo.setPickUpTimes("");
            }else {
                orderDetailVo.setPickUpTimes(DateUtils.dateFormat(tbOddNum.getPickUpTime(),DateUtils.DATE_TIME_PATTERN));
            }
            if (tbOddNum.getDeliveryTime() == null){
                orderDetailVo.setDeliveryTimes("");
            }else {
                orderDetailVo.setDeliveryTimes(DateUtils.dateFormat(tbOddNum.getDeliveryTime(),DateUtils.DATE_TIME_PATTERN));
            }
            if (tbOddNum.getAccomplishTime() == null){
                orderDetailVo.setAccomplishTimes("");
            }else {
                orderDetailVo.setAccomplishTimes(DateUtils.dateFormat(tbOddNum.getAccomplishTime(),DateUtils.DATE_TIME_PATTERN));
            }
            if (tbOddNum.getOutOddNumTime() == null){
                orderDetailVo.setOutOddNumTimes("");
            }else {
                orderDetailVo.setOutOddNumTimes(DateUtils.dateFormat(tbOddNum.getOutOddNumTime(),DateUtils.DATE_TIME_PATTERN));
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return orderDetailVo;
    }

    @Override
    public PageData<TbOddNum> listByCondition(Integer page, Integer limit, OrderSearchVo orderSearchVo) {
        PageData<TbOddNum> userPageData = new PageData<>();
        //然后模糊匹配订单
        QueryWrapper<TbOddNum> oddNumQueryWrapper = new QueryWrapper<>();
        System.out.println(orderSearchVo.toString());
        if (StringUtils.isNotEmpty(orderSearchVo.getAccount())){
            oddNumQueryWrapper.inSql("user_id","SELECT id from admin_user where account like '%"  + orderSearchVo.getAccount() +  "%'");
        }
        if (StringUtils.isNotEmpty(orderSearchVo.getPickUpPerson())){
            oddNumQueryWrapper.eq("pick_up_person",orderSearchVo.getPickUpPerson());
        }
        if (StringUtils.isNotEmpty(orderSearchVo.getStartTime())&&StringUtils.isNotEmpty(orderSearchVo.getEndTime())){
            oddNumQueryWrapper.between("add_time",orderSearchVo.getStartTime(),orderSearchVo.getEndTime());
        }
        if (StringUtils.isNotEmpty(orderSearchVo.getTrackingNumber())){
            oddNumQueryWrapper.like("sys_num",orderSearchVo.getTrackingNumber())
                    .or().like("tracking_number",orderSearchVo.getTrackingNumber());
        }
        if (StringUtils.isNotEmpty(orderSearchVo.getPayType())){
            oddNumQueryWrapper.eq("pay_type",orderSearchVo.getPayType());
        }
        if (StringUtils.isNotEmpty(orderSearchVo.getOrderStatu())){
            oddNumQueryWrapper.eq("order_state",orderSearchVo.getOrderStatu());
        }
        if (StringUtils.isNotEmpty(orderSearchVo.getOrderArea())){
            oddNumQueryWrapper.eq("order_area",orderSearchVo.getOrderArea());
        }
        oddNumQueryWrapper.ne("order_state",-1);
        PageHelper.startPage(page,limit);
        List<Map<String, Object>> userMaps = tbOddNumService.listMaps(oddNumQueryWrapper);
        userMaps.forEach(e ->{
            Integer personId = (Integer) e.get("pick_up_person");
            //获取取件人
            if (personId == null){
                e.put("personName","");
            }else {
                e.put("personName",adminUserService.getById(personId).getName());
            }
            Integer userId = (Integer)e.get("user_id");
            //获取发货人
            if (StringUtils.isEmpty(adminUserService.getById(userId).getName())){
                e.put("account","未知");
            }else {
                e.put("account",adminUserService.getById(userId).getName());
            }
            //获取支付方式
            Integer payType = (Integer) e.get("pay_type");
            TbPayType tbPayType = tbPayTypeService.getById(payType);
            e.put("pay_type",tbPayType.getPayType());
            //获取订单所在区域
            Integer area = Integer.parseInt(e.get("order_area").toString());
            TbArea tbArea = tbAreaService.getById(area);
            e.put("order_area",tbArea.getAreaName());
        });
        PageInfo pageInfo = new PageInfo(userMaps);
        userPageData.setCount(pageInfo.getTotal());
        userPageData.setData(pageInfo.getList());
        return userPageData;
    }

    private String getAdderStr(String addresser){
        String[] split = addresser.split("@");
        String str = "";
        for (int i = 0;i<split.length;i++) {
            if (i == split.length-1){
                str+=split[i];
                return str;
            }
            TbProvinceCityDistrict cityDistrict = tbProvinceCityDistrictService.getById(split[i]);
            str+=cityDistrict.getName();
        }
        return str;
    }
}
