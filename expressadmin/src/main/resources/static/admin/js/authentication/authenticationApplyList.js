layui.use(['layer','form','table'], function() {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        t;                  //表格数据变量

    t = {
        elem: '#authenticationApplyListTable',
        url:'/authenticationApply/applyList',
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
            {field:'id', title: '编号',hide:'false'},
            {field:'account', title: '登录账户', width:'12%'},
            {field:'name',  title: '昵称',    width:'12%'},
            {field:'userType',  title: '用户类型',    width:'12%' ,toolbar:'#vipUserType'},
            {field:'status', title: '用户状态', width:'12%',templet:'#vipUserUserStatus'},
            {field:'userArea',  title: '用户所在区域',    width:'15%' ,templet: function(d){
                    return '<span>'+d.area.areaName+'</span>'
                } },
            {field:'createTime',  title: '创建时间',width:'15%'}, //单元格内容水平居中
            {fixed: 'right',title: '操作', align: 'center', toolbar: '#agencyApplyListBar'}
        ]]
        ,done: function () {
            $("[data-field='tbVips']").css('display','none');
            $("[data-field='tbAreas']").css('display','none');
        }
    };
    table.render(t);

    //监听工具条
    table.on('tool(authenticationApplyList)', function(obj){
        var data = obj.data;

        if(obj.event === 'authenticationAudit'){
            var editIndex = layer.open({
                title : "认证审核",
                type : 2,
                area : ['60%', '70%'],
                content : "/authenticationApply/authenticationInlet?id="+data.id,
                success : function(layero, index){
                    setTimeout(function(){
                        layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
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
        table.reload('vipUserTable', t);
        return false;
    });

});