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
        elem: '#drawApplyTable',
        url:'/admin/draw/getDrawAll',

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
            {field:'drawPassUser', title: '会员名称',    width:'12%'},
            {field:'drawPrice', title: '提现金额' },
            {field:'drawServiceCharge', title: '提现手续费',    width:'12%'},
            {field:'drawStatu', title: '状态',   width:'16%' ,templet:'#drawStatus'},
            {field:'drawAddTime',  title: '申请时间',width:'14%'}, //单元格内容水平居中
            {field:'drawUpdateTime',  title: '更新时间',width:'14%'},
            {fixed:'right', title: '操作', align: 'center', toolbar: '#drawAuditBar'}
        ]]
    };
    table.render(t);

    //监听工具条
    table.on('tool(drawApplyList)', function(obj){
        var data = obj.data;
        //审核按钮
        if(obj.event === 'drawAudit'){
            var editIndex = layer.open({
                title : "提现审核",
                type : 2,
                area: ['40%', '60%'],
                scrollbar: false,
                offset: 'auto',
                content : "/admin/draw/update?id="+data.id,
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
        table.reload('drawApplyTable', t);
        return false;
    });
});