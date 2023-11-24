window.addEventListener('message', (event) => {
    let e = event.data;

    if (e.action === "open") {
        $('.body').css('display', 'block');
        $('.body').fadeIn(500);
    }

    var silverbutton = document.getElementById('silverkit')
    silverbutton.addEventListener('click', function() {
        $.post(`https://${GetParentResourceName()}/silverbutton`, JSON.stringify());
    }, false);

    var goldenkitbutton = document.getElementById('goldenkit')
    goldenkitbutton.addEventListener('click', function() {
        $.post(`https://${GetParentResourceName()}/goldenkitbutton`, JSON.stringify());
    }, false);

    var diamondkitbutton = document.getElementById('diamondkit')
    diamondkitbutton.addEventListener('click', function() {
        $.post(`https://${GetParentResourceName()}/diamondkitbutton`, JSON.stringify());
    }, false);
});


$(document).on("keydown", function(e){
    if (e.which == 27) {
        $('.body').css('display', 'none');
        $('.body').fadeOut(500);
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify());
    }
})