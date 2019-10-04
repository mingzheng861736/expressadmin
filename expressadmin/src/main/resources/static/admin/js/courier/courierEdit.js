var iconShow,$;
layui.use(['form','jquery','layer'],function(){
    var form = layui.form,
        layer = layui.layer;
    $    = layui.jquery;

    form.on("submit(editArea)",function(data){
        if(data.field.id == null){
            layer.msg("菜单ID不存在",{time:1000});
            return false;
        }
        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });

        $.post("/admin/courier/edit",data.field,function (res) {
            layer.close(loadIndex);
            if(res.success){
                parent.layer.msg("编辑成功!",{time:1500},function(){
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