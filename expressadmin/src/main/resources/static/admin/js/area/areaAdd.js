var iconShow,$;
layui.use(['form','jquery','layer'],function(){
    var form = layui.form,
        layer = layui.layer;
    $ = layui.jquery;

    // $('.color-box').colpick({
    //     colorScheme:'dark',
    //     layout:'rgbhex',
    //     color:'ff8800',
    //     onSubmit:function(hsb,hex,rgb,el) {
    //         $(el).css('background-color', '#'+hex);
    //         $(el).colpickHide();
    //         $("input[name='bgColor']").val("#"+hex);
    //     }
    // }).css('background-color', '#ff8800');


    form.on("submit(addArea)",function(data){

        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });
        $.post("/admin/system/area/postAdd",data.field,function (res) {
            layer.close(loadIndex);
            if(res.success){
                parent.layer.msg("添加成功!",{time:1500},function(){
                    //刷新父页面
                    parent.location.reload();
                });
            }else{
                layer.msg(res.message);
            }
        });
        return false;
    });

});