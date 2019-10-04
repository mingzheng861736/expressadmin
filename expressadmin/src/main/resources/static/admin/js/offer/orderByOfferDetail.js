layui.use(['layer','form','table','laydate'], function() {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        laydate = layui.laydate,
        t;                  //表格数据变量
    t = {
        elem: '#earningsDetailTable',
        url:'/admin/offer/offerDeail',
        method:'post',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits:[3,10, 20, 30]
        },
        width: $(parent.window).width(),
        cellMinWidth: 80,
        cols: [[
            {type:'checkbox',width:'3%'},
            {field:'id',  title: '编号',width:'7%'},
            {title: '发件人',
                 templet:function (d) {
                     return '<span>'+d.tbAdminUser.name+'</span>'
                 },width:'10%'},
            {field:'addresser',  title: '发件人信息',width:'10%'},
            {field:'recipients',  title: '收件人信息',width:'10%'},
            {field:'goodInfo',  title: '商品信息',width:'10%'},
            {field:'orderState',  title: '订单状态',toolbar:'#orderStatus ',width:'10%'},
            {title: '区域',
                templet:function (d) {
                    return '<span>'+d.tbArea.areaName+'</span>'
                },width:'10%'},
            {title: '快递公司',
                templet:function (d) {
                    return '<span>'+d.tbTracking.trackingCompanyName+'</span>'
                },width:'10%'},
            {field:'courierCost',  title: '今日价格',width:'10%'},
            {field:'addTime',  title: '添加时间',width:'10%'}
        ]]
    };
    table.render(t);


    //监听工具条
    table.on('tool(vipUserList)', function(obj){
        var data = obj.data;
        if(obj.event === 'edit'){
            var editIndex = layer.open({
                title : "查看vip用户详细信息",
                type : 2,
                content : "/admin/offer/offerDeail?id="+data.id,
                success : function(layero, index){
                    setTimeout(function(){
                        layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
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


    });



    $('.layui-inline .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //搜索
    form.on("submit(searchForm)",function(data){
        t.where = data.field;
        table.reload('vipUserTable', t);
        return false;
    });
});
