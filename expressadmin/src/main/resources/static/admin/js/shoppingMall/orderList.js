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
        elem: '#integralShoppingMallTable',
        url:'/admin/mall/orderManage/list',
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
        cols: [[
            {type:'checkbox'},
            {field:'id', title: '订单编号',width:'7%'},
            {field:'goodsId',  title: '商品',width:'10%' ,templet: function(d){
                    return '<span>'+d.tbGoods.goodsName+'</span>'
                }},
            {field:'goodsNum',  title: '数量' ,width:'5%'},
            {field:'userId',  title: '用户' ,templet: function(d){
                    return '<span>'+d.adminUser.name+'</span>'
                },width:'10%' },
            {field:'orderTime', title: '下单时间',width:'10%'},
            {field:'goodsPriceTotal',  title: '商品总额',width:'10%'},
            {field:'payAmount',  title: '支付金额' ,width:'10%'},
            {field:'orderStatus',  title: '订单状态',toolbar:'#orderStatusBar',width:'7%'},
            {field:'isPayOff',  title: '是否付清',width:'7%',toolbar:'#isPayOffBar'},
            {field:'payTime',  title: '支付时间',width:'10%'},
            {fixed: 'right',title: '操作', align: 'center', toolbar: '#orderBar'}
        ]]
        /*,done: function () {//数据渲染完的回调。你可以借此做一些其它的操作
            $("[data-field='tbVips']").css('display','none');
            $("[data-field='tbAreas']").css('display','none');
        }*/
    };
    table.render(t);

    //监听工具条
    table.on('tool(integralShoppingMallList)', function(obj){
        var data = obj.data;
        if(obj.event === 'status'){  //状态变更
            var locked = data.orderStatus;
            layer.confirm("你确定要变更此订单吗？" ,{btn:['是的,我确定','我再想想']},
                function(){
                    $.post("/admin/mall/orderManage/stateChanges",{"id":data.id,"orderStatus":data.orderStatus},function (res){
                        console.log(res);
                        if(res.code==200){
                            layer.msg(res.msg,{time: 1000},function(){
                                table.reload('integralShoppingMallTable', t);
                            });
                        }else{
                            layer.msg(res.msg);
                        }
                    });
                }
            );
        }

        if(obj.event === 'orderDetails'){  //订单详情
            var editIndex = layer.open({
                title : "收益统计明细",
                type : 2,
                area: ['50%', '50%'],
                scrollbar: false,
                offset: 'auto',
                content : "/admin/mall/orderManage/orderDetailsInlet?id="+data.id,
                success : function(layero, index){
                    setTimeout(function(){
                        layer.tips('点击此处返回订单列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                }
            });
        }

    });

    //搜索
    form.on("submit(searchForm)",function(data){
        t.where = data.field;
        table.reload('integralShoppingMallTable', t);
        return false;
    });

});