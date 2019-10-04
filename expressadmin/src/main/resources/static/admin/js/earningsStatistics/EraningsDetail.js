layui.use(['layer','form','table','laydate'], function() {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        t;                  //表格数据变量

    var laydate = layui.laydate;
    laydate.render({
        elem: '#startTime',
        type: 'datetime'
    });
    laydate.render({
        elem: '#endTime',
        type: 'datetime'
    });

    var addTime = $("#de_addTime").val();
    var account = $("#de_account").val();
    t = {
        elem: '#earningsDetailTable',
        url:'/admin/vipEarningStatistics/detailList',
        data: [{"addTime":addTime}, {"account":account}],
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
        cols: [[
            {type:'checkbox'},
            {field:'id', title: '编号'},
            {field:'userName',  title: '昵称'},
            {field:'addTime',  title: '时间'}, //单元格内容水平居中
            {field:'fundTypeNmae',  title: '收入支出'},
            {field:'money',  title: '金额'},
            {field:'purposeInfo',  title: '用途'}
        ]]
    };
    table.render(t);

    //监听工具条
    table.on('tool(vipEarningsStatisticsList)', function(obj){
        var data = obj.data;

    });



    $('.layui-inline .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //搜索
    form.on("submit(searchForm)",function(data){
        t.where = data.field;
        table.reload('earningsDetailTable', t);
        return false;
    });

});