var index = parent.layer.getFrameIndex(window.name); //当前窗口索引
layui.use(['form','jquery','layer'],function(){
    var form = layui.form,
        $    = layui.jquery,
        layer = layui.layer;

    form.on("submit(editUser)",function(data){
        if(data.field.id == null){
            layer.msg("用户ID不存在");
            return false;
        }
        //给角色赋值
        delete data.field["roles"];
        var selectRole = [];
        $('input[name="roles"]:checked').each(function(){
            selectRole.push({"id":$(this).val()});
        });
        data.field.roleLists = selectRole;

        //判断用户是否后台用户
        if(undefined !== data.field.adminUser && null != data.field.adminUser){
            data.field.adminUser = true;
        }else{
            data.field.adminUser = false;
        }

        //判断用户是否启用
        if(undefined !== data.field.locked && null != data.field.locked){
            data.field.locked = false;
        }else{
            data.field.locked = true;
        }

        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });
        $.ajax({
            type:"POST",
            url:"/admin/system/user/edit",
            dataType:"json",
            contentType:"application/json",
            data:JSON.stringify(data.field),
            success:function(res){
                layer.close(loadIndex);
                if(res.success){
                    parent.layer.msg("用户编辑成功！",{time:1500},function(){
                        parent.location.reload();
                    });
                }else{
                    layer.msg(res.message);
                }
            }
        });
        return false;
    });

    form.on('switch(adminUser)', function(data){
        $("#adminUser").val(data.elem.checked);
    });

    form.on('switch(locked)', function(data){
        $("#locked").val(data.elem.checked);
    });

    $("#showLogistics").click(function () {
        var orderId = $(" input[ name='id' ] ").val()
        layer.open({
            title : "物流信息",
            type : 2,
            content : "/admin/order/logistics?id="+orderId,
            success : function(layero, index){
                setTimeout(function(){
                    layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500);
            }
        });
    })

    form.on("submit(submitTrack)",function(data){
        //弹出loading
        var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
        var msg;
        $.ajax({
            type: "post",
            url: "/admin/order/submitTrack",
            contentType:"application/json",
            data:JSON.stringify(data.field),
            success:function(d){
                if(d.code==0){
                    msg="出单成功！请刷新";
                }else{
                    msg=d.msg;
                }
                layer.msg(msg);
            }
        });
        setTimeout(function(){
            top.layer.close(index);
            top.layer.msg(msg);
            layer.msg(msg);
            layer.closeAll("iframe");
            //刷新父页面
            parent.location.reload();
        },2000);
        return false;
    })
});

