NoLag = {}
NoLag.Heists = {}

window.addEventListener('message', function(event) {
    switch(event.data.action) {
        case "open":
            $(".keypad-container").fadeIn(250);
        break;
        case "close":
            NoLag.Heists.Close()
        break;
    }
});

$(document).on('click', '.submit', function(e){
    e.preventDefault();
    NoLag.Heists.Submit();
    NoLag.Heists.Close();
});

NoLag.Heists.Open = function() {
    $('#pass').val('');
    $(".keypad-container").fadeIn(250);
}

NoLag.Heists.Close = function() {
    $(".keypad-container").fadeOut(250);
    $.post(`https://${GetParentResourceName()}/Close`);
    $('#pass').val('');
}

NoLag.Heists.Submit = function() {
    $.post(`https://${GetParentResourceName()}/CheckPincode`, JSON.stringify({
        pincode: $('#pass').val(),
    }));
}


document.onkeyup = function (data) {
    if (data.code == 'Enter' ) {
        NoLag.Heists.Submit();
        NoLag.Heists.Close();
    } else if (data.code == 'Escape' ) {
        NoLag.Heists.Close();
    }
}