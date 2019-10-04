layui.config({
    base: '/static/admin/'
}).extend({
    treetable: 'js/treetable'
}).use(['layer','form','table','treetable'], function() {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        treetable = layui.treetable,
        t;

    t={
        elem: '#authTable',
        url: '/admin/goods/goodsList',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits:[3,10, 20, 30]
        },
        cols: [[
            {field: 'goodsName', title: '商品名称'},
            {field: 'goodsPrice', title: '商品价格'},
            {field: 'goodsStockpile',  title: '商品库存'},
            {field: 'goodsInfo',  title: '商品详细信息'},
            {field: 'isPutaway',  title: '是否上架',templet:"#goodsStatus"},
            {field: 'createTime',  title: '创建时间'},
            {field: 'updateTime',  title: '更新时间'},
            {templet: '#authBar', align: 'center', title: '操作'}
        ]],
        // done: function () {
        //     layer.closeAll('loading');
        // }
    };
   table.render(t);
    table.on('tool(authList)', function(obj){
        var data = obj.data;
        if(obj.event === 'editChildArea'){
            layer.open({
                title : "编辑菜单",
                type : 2,
                area : [ '50%', '70%' ],
                content : "/admin/goods/edit?id="+data.id,
                success : function(layero, editIndex){
                    setTimeout(function(){
                        layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                }
            });
        }
        if(obj.event === "delArea"){
            layer.confirm("你确定要删除么？",{btn:['是的,我确定','我再想想']},
                function(){
                    $.post("/admin/goods/delete",{"id":data.id},function (res){
                        if(res.success){
                            layer.msg("删除成功",{time: 1000},function(){
                                location.reload();
                            });
                        }else{
                            layer.msg(res.message);
                        }
                    });
                }
            )
        }
    });

    var active={
        addArea : function(){
            var addIndex = layer.open({
                title : "添加商品",
                type : 2,
                area : [ '50%', '70%' ],
                content : "/admin/goods/add",
                success : function(layero, addIndex){
                    setTimeout(function(){
                        layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                }
            });
        }
    };

    $('.layui-inline .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //搜索
    form.on("submit(searchForm)",function(data){
        t.where = data.field;
        table.reload('authTable', t);
        return false;
    });
});