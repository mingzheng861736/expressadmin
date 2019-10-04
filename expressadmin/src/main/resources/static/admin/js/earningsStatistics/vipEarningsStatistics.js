layui.use(['layer','form','table','laydate'], function() {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        t;                  //表格数据变量

    var laydate = layui.laydate;
    laydate.render({
        elem: '#startTime',
        type: 'date'
    });
    laydate.render({
        elem: '#endTime',
        type: 'date'
    });

    t = {
        elem: '#vipEarningsStatisticsTable',
        url:'/admin/vipEarningStatistics/lists',
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
            {field:'account', title: '登录账户', width:'20%'},
            {field:'name',  title: '昵称',    width:'15%'},
            {field:'userType',  title: '用户类型',    width:'15%',toolbar:'#vipUserType'},
            {field:'date',  title: '时间',width:'20%'}, //单元格内容水平居中
            {field:'eranings',  title: '收益',    width:'15%'},
            {fixed:'right', title: '操作', align: 'center',  toolbar: '#earningsStatisticsBar'}
        ]]
    };
    table.render(t);

    //监听工具条
    table.on('tool(vipEarningsStatisticsList)', function(obj){
        var data = obj.data;
        //明细按钮
        if(obj.event === 'detail'){
            var editIndex = layer.open({
                title : "收益统计明细",
                type : 2,
                area: ['100%', '100%'],
                scrollbar: false,
                offset: 'auto',
                content : "/admin/vipEarningStatistics/detailInlet?addTime="+data.date+"&account="+data.account,
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



    $('.layui-inline .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //搜索
    form.on("submit(searchForm)",function(data){
        t.where = data.field;
        table.reload('vipEarningsStatisticsTable', t);
        return false;
    });

});