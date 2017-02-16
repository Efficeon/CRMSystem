// Каждому элменту у которого есть подменю, добавляем класс parent
$(".left-navigation li ul").each(function(){
    $(this).parent().addClass("parent");
});

// Если пункт меню active, отображаем его и устанавливаем класс open
$(".left-navigation li ul li.active").each(function(){
    $(this).parent().css({'display':'block'});
    $(this).parent().parent().addClass("open");
});
$(document).click(function(){
    $("#hello").hide('slow');
});

$("#hello").click(function(e){
    e.stopPropagation();
});
// При клике на меню у которого есть подменю (класс parent) - плавно закрываем меню
$(".left-navigation").delegate(".parent > a","click",function(e){
    $(".left-navigation .parent.open > ul").not($(this).parent().find("ul")).slideUp(300, 'swing',function(){
        $(this).parent().removeClass("open");
    });

    var ul = $(this).parent().find("ul"); // ссылка на родительский ul
    // Открываем или закрываем меню
    ul.slideToggle(300, 'swing', function () {
        var p = $(this).parent();
        if(p.
            hasClass("open")){
            p.removeClass("open");
        }else{
            p.addClass("open");
        }
    });
    e.preventDefault();
});

$('[data-toggle]').on('click', function(e){
    e.preventDefault;
    var thisLink = $(this);
    var toToggle = $( thisLink.data('toggle') );
    toToggle.slideToggle(200);
})
