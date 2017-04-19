function show() {
    $.ajax({
        url:"/message/listUsers/",
        dataType:'html',
        data: {ajax:true},
        type:'GET',
        success:function(html){
            $('#contentMessage1').html(html);
        }
    });
}
setInterval(show , 2000);