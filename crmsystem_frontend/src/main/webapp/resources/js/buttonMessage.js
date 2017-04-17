function show() {
    $.ajax({
        url:"/message/newMessages/",
        dataType:'html',
        data: {ajax:true},
        type:'GET',
        success:function(html){
            $('#activeButton').html(html);
        }
    });
}
setInterval(show , 1000);