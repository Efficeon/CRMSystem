function show() {
    $.ajax({
        url:"/message/personalMessages/",
        dataType:'html',
        data: {ajax:true},
        type:'GET',
        success:function(html){
            $('#contentMessage2').html(html);
        }
    });
}
setInterval(show , 1000);


