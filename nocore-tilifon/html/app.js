NoLag = {}
NoLag.Phone = {}

NoLag.Phone.Open = function(Timeout, Percentage) {
    $("#phone").css({'display':'block'}).animate({
        bottom: Percentage+"%",
    }, Timeout);
}

NoLag.Phone.Close = function(Timeout, Percentage) {
    $("#phone").css({'display':'block'}).animate({
        bottom: Percentage+"%",
    }, Timeout, function(){
        $("#phone").css({'display':'none'});
    });
}

/*$(document).on('keypress',function(e) {
    console.log(e.which)
    if(e.which == 13) {
        NoLag.Phone.Open(500, 0)
    } else if (e.which == 100) {
        NoLag.Phone.Close(500, -70)
    }
});*/

window.addEventListener('message', (event) => {
    let d = event.data
    if ( d.action === 'openPhone') {
        NoLag.Phone.Open(500, 0);
    } else if (d.action === 'closePhone') {
        NoLag.Phone.Close(500, -70);
    }
});

//NoLag.Phone.Open(500, 0)