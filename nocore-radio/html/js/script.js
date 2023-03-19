$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "open") {
            DBRadio.SlideUp()
        }

        if (event.data.type == "close") {
            DBRadio.SlideDown()
        }
    });

    document.onkeyup = function (data) {
        if (data.which == 27) { // Escape key
            $.post('https://nocore-radio/escape', JSON.stringify({}));
            DBRadio.SlideDown()
        } else if (data.which == 13) { // Enter key
            $.post('https://nocore-radio/joinRadio', JSON.stringify({
                channel: $("#channel").val()
            }));
        }
    };
});

DBRadio = {}

$(document).on('click', '#submit', function(e){
    e.preventDefault();

    $.post('https://nocore-radio/joinRadio', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#disconnect', function(e){
    e.preventDefault();

    $.post('https://nocore-radio/leaveRadio');
});

$(document).on('click', '#volumeUp', function(e){
    e.preventDefault();

    $.post('https://nocore-radio/volumeUp', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#volumeDown', function(e){
    e.preventDefault();

    $.post('https://nocore-radio/volumeDown', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#decreaseradiochannel', function(e){
    e.preventDefault();

    $.post('https://nocore-radio/decreaseradiochannel', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#increaseradiochannel', function(e){
    e.preventDefault();

    $.post('https://nocore-radio/increaseradiochannel', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#poweredOff', function(e){
    e.preventDefault();

    $.post('https://nocore-radio/poweredOff', JSON.stringify({
        channel: $("#channel").val()
    }));
});

DBRadio.SlideUp = function() {
    $(".container").css("display", "block");
    $(".radio-container").animate({bottom: "6vh",}, 250);
}

DBRadio.SlideDown = function() {
    $(".radio-container").animate({bottom: "-110vh",}, 400, function(){
        $(".container").css("display", "none");
    });
}
