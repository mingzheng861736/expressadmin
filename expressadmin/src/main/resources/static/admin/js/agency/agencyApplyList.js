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
        elem: '#agencyApplyListTable',
        url:'/admin/agency/applyList',
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
            {field:'id', title: '编号',hide:'false', width:'5%'},
            {field:'userId', title: '用户', width:'10%',templet: function(d){
                    return '<span>'+d.adminUser.name+'</span>'
                }},
            {field:'areaId',  title: '区域', width:'10%',templet: function(d){
                    return '<span>'+d.tbArea.areaName+'</span>'
                }},
            {field:'cardNumber',  title: '身份证号',width:'15%'},
            {field:'telNumber',  title: '电话号码',width:'15%'}, //单元格内容水平居中
            {field:'createTime',  title: '时间', width:'15%'},
            {fixed:'right', title: '操作', align: 'center',  toolbar: '#agencyApplyListBar'}
        ]]
    };
    table.render(t);

    //监听工具条
    table.on('tool(agencyApplyList)', function(obj){
        var data = obj.data;
        //审核按钮
        if(obj.event === 'agencyAudit'){
            var editIndex = layer.open({
                title : "代理申请审核",
                type : 2,
                area: ['40%', '60%'],
                scrollbar: false,
                offset: 'auto',
                content : "/admin/agency/auditInlet?id="+data.id,
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
        table.reload('agencyApplyListTable', t);
        return false;
    });

});