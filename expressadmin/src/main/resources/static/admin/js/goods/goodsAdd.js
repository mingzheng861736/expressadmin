var iconShow,$;
layui.use(['form','jquery','layer','upload','layedit'],function(){
    var form = layui.form,
        layer = layui.layer,
        upload = layui.upload,
        layedit = layui.layedit;
    $ = layui.jquery;

    //富文本编辑器
    layedit.build('goodsInfo',{//建立编辑器
        height: 180 //设置编辑器高度
        ,hideTool:['image','face','link']
    });


    //执行实例
    var uploadInst = upload.render({
        elem: '#uploadImg' //绑定元素
        ,url: '/admin/img/upload/' //上传接口
        ,accept: 'images'
        ,size: 0
        ,done: function(res, index, upload){
            //上传完毕回调
            console.log("上传完了"+res);
            console.log(layui.$.fn.jquery);
            if(res.success){
                // console.log($('#showImage'))
                $('#imagesHid').val(res.data.url);
                document.getElementById('imagesHid').value=res.data.url;
                $('#showImage').attr('src', res.data.url);
                $('#showImage').css("margin-top","15px");
                layer.msg(res.message);
            }else{
                layer.msg(res.message);
            }
        }
        ,error: function(){
            //请求异常回调
        }
    });

    form.on("submit(addArea)",function(data){

        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });
        $.post("/admin/goods/postAdd",data.field,function (res) {
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