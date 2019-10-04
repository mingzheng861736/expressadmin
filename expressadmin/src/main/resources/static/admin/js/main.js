layui.use(['form','element','table','layer','jquery'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        element = layui.element,
        table = layui.table,
        $ = layui.jquery,
        t,b,c;                  //表格数据变了

    t = {
        elem: '#homeAgencyApplyTable',
        url:'/home_page/agencyAudit',
        method:'post',
        width : '800px',
        // height : '80%',
       page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits:[3]
        },
        width: $(parent.window).width(),
        cols: [[
            {field:'userId',width:'28%', title: '用户',templet: function(d){
                    return '<span>'+d.adminUser.name+'</span>'
                }},
            {field:'areaId',width:'28.5%',  title: '区域',templet: function(d){
                    return '<span>'+d.tbArea.areaName+'</span>'
                }},
            {field:'createTime',width:'29.2%',  title: '时间'}
        ]]
    };
    table.render(t);
    //今日快递订单
    b = {
        elem: '#todayOddNumTable',
        url:'/home_page/todayOddNum',
        method:'post',
        width : '800px',
        // height : '80%',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits:[3]
        },
        width: $(parent.window).width(),
        cols: [[
            {field:'userId',width:'16%', title: '发件人',templet: function(d){
                    return '<span>'+d.tbAdminUser.name+'</span>'
                }},
            {field:'pick_up_person',width:'16%', title: '取件人',templet: function(d){
                    return '<span>'+d.pickPerson.name+'</span>'
                }},
            {field:'order_area',width:'17.5%',  title: '区域',templet: function(d){
                    return '<span>'+d.tbArea.areaName+'</span>'
                }},
            {field:'goodInfo',width:'18.2%',  title: '商品'},
            {field:'addTime',width:'18%',  title: '时间'}
        ]]
    };
    table.render(b);

    //积分商城逾期订单
    c = {
        elem: '#overdueGoodsTable',
        url:'/home_page/overdueGoodsOrder',
        method:'post',
        width : '800px',
        // height : '80%',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits:[3]
        },
        width: $(parent.window).width(),
        cols: [[
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
            {field:'payTime',  title: '支付时间',width:'10%'}
        ]]
    };
    table.render(c);
    $(".panel a").on("click",function(){
        window.parent.addTab($(this));
    });

    //数字格式化
    $(".panel span").each(function(){
        $(this).html($(this).text()>9999 ? ($(this).text()/10000).toFixed(2) + "<em>万</em>" : $(this).text());
    });


});


