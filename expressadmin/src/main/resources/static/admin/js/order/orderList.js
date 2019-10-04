layui.use(['layer','form','table','laydate'], function() {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        laydate = layui.laydate,
        t;                  //表格数据变量
    laydate.render({
        elem: '#startTime',
        type: 'datetime'
    });
    laydate.render({
        elem: '#endTime',
        type: 'datetime'
    });

    t = {
        elem: '#orderTable',
        url:'/admin/order/list',
        method:'post',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits:[3,10, 20, 30]
        },
        width: $(parent.window).width()-223,
        cellMinWidth: 80,
        cols: [[
            {type:'checkbox'},
            {field:'account', title: '用户名'},
            {field:'personName',     title: '取件人'},
            {field:'pay_type',       title: '支付方式'},
            {field:'sys_num', title: '系统单号', width:'8%'},
            {field:'pay_price', title: '订单金额',sort: true, width:'8%'},
            {field:'order_area', title: '订单区域', width:'8%'},
            {field:'tracking_number', title: '快递单号', width:'8%'},
            {field:'order_state',    title: '订单状态',templet:'#orderStatus'},
            {field:'add_time',  title: '创建时间', sort: true,templet:'<span>{{ layui.laytpl.toDateString(d.add_time) }}</span>'}, //单元格内容水平居中
            {fixed:'right', title: '操作', align: 'center', toolbar: '#orderBar'}
        ]]
    };
    table.render(t);

    //监听工具条
    table.on('tool(orderList)', function(obj){
        var data = obj.data;
        if(obj.event === 'lock'){
            var locked = data.locked;
            layer.confirm("你确定要" + (locked ? "重新启用" : "锁定") + "该用户么？" ,{btn:['是的,我确定','我再想想']},
                function(){
                    $.post("/admin/system/user/lock",{"id":data.id},function (res){
                        if(res.success){
                            layer.msg("操作成功",{time: 1000},function(){
                                table.reload('orderTable', t);
                            });
                        }else{
                            layer.msg(res.message);
                        }
                    });
                }
            );
        }

        if(obj.event === 'detail'){
            var editIndex = layer.open({
                // title : "订单明细",
                type : 2,
                content : "/admin/order/detail?id="+data.id,
                success : function(layero, index){
                    setTimeout(function(){
                        layer.tips('点击此处返回订单列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function(){
                layer.full(editIndex);
            });
            layer.full(editIndex);
        }


        if(obj.event === 'inputTrack'){
            layer.open({
                type : 2,
                title : "输入快递单号",
                area : [ '400px', '500px' ],
                content : "/admin/order/inputTrack?id="+data.id
            })
        }

        if(obj.event === "del"){
            layer.confirm("你确定要删除该用户么？",{btn:['是的,我确定','我再想想']},
                function(){
                    $.post("/admin/system/user/delete",{"id":data.id},function (res){
                        if(res.success){
                            layer.msg("删除成功",{time: 1000},function(){
                                table.reload('orderTable', t);
                            });
                        }else{
                            layer.msg(res.message);
                        }

                    });
                }
            );
        }
    });

    //功能按钮
    var active={
        addUser : function(){
            var addIndex = layer.open({
                title : "添加用户",
                type : 2,
                content : "/admin/system/user/add",
                success : function(layero, addIndex){
                    setTimeout(function(){
                        layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function(){
                layer.full(addIndex);
            });
            layer.full(addIndex);
        },
        deleteSome : function(){                        //批量删除
            var checkStatus = table.checkStatus('orderTable'),
                data = checkStatus.data;
            if(data.length > 0){
                for(var i=0;i<data.length;i++){
                    var d = data[i];
                    if(d.adminUser){
                        layer.msg("不能删除超级管理员");
                        return false;
                    }
                }
                layer.confirm("你确定要删除这些用户么？",{btn:['是的,我确定','我再想想']},
                    function(){
                        var deleteindex = layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
                        $.ajax({
                            type:"POST",
                            url:"/admin/system/user/deleteSome",
                            dataType:"json",
                            contentType:"application/json",
                            data:JSON.stringify(data),
                            success:function(res){
                                layer.close(deleteindex);
                                if(res.success){
                                    layer.msg("删除成功",{time: 1000},function(){
                                        table.reload('orderTable', t);
                                    });
                                }else{
                                    layer.msg(res.message);
                                }
                            }
                        });
                    }
                )
            }else{
                layer.msg("请选择需要删除的用户",{time:1000});
            }
        }
    };

    $('.layui-inline .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //搜索
    form.on("submit(searchForm)",function(data){
        t.where = data.field;
        table.reload('orderTable', t);
        return false;
    });
});