var elements = $('.prompt'), n = 0, n_max = 2;
$(".left, .right").click(function () {
    n += $(this).hasClass('left') ? 1 : -1;
    if (n > n_max) n = 0;
    if (n < 0) n = n_max;
    
    $(elements).hide();
    $(elements[n]).show();
    return false;
}).click();