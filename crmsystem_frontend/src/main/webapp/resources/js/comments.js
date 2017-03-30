$(function(){

    $('#spoiler').click(function(){
        $('.hidden').slideDown();
        $('#spoiler').text('Скрыть');
    });

});

        function toggleDiv(id){
            var el=document.getElementById(id);
            if(el.style.display=="block"){
                el.style.display="none";
            } else {
                el.style.display="block";
            }
        }


