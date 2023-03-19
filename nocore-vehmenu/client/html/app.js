var open = false;
var frontPanel = true
$('#main-container').fadeOut(0);

function checkElement(settings, element, settingName) {
    if (settings[settingName] == true) {
        $(element).css('color', '#6840ce');
        $(element).css('border-color', '#6840ce');
        $(element).css('background-color', '#0d0808');
    }
    else {
        $(element).css('color', '');
        $(element).css('border-color', '');
        $(element).css('background-color', '');
    }
}

function checkSeat(settings, element, settingName) {
    if (settings[settingName] === parseInt($(element).attr('value'))) {
        $(element).css('color', '#6840ce');
        $(element).css('border-color', '#6840ce');
        $(element).css('background-color', '#0d0808');
    }
    else if (settings[settingName] === true) {
        $(element).css('color', '');
        $(element).css('border-color', '');
        $(element).css('background-color', '');
        return;
    }
}

$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.type == "enablecarmenu") {
            open = event.data.enable;
            if (open) {
                document.body.style.display = "block";
                setTimeout(function () {
                    $('#main-container').fadeIn(500);
                }, 1);
            }
            else {
                $('#main-container').fadeOut(0);
                setTimeout(function () {
                    document.body.style.display = "none";
                }, 100);
            }
        }
        if (event.data.type == "refreshcarmenu") {
            settings = event.data.settings
            $('.seat').each(function (i, v) {
                var val = parseInt($(v).attr('value'));
                if (val == -1)
                    checkSeat(settings, $(v), 'seat1');
                if (val == 0)
                    checkSeat(settings, $(v), 'seat2');
                if (val == 1)
                    checkSeat(settings, $(v), 'seat3');
                if (val == 2)
                    checkSeat(settings, $(v), 'seat4');
            });
            $('.door').each(function (i, v) {
                if (!settings.doorAccess) {
                    $(v).parent().addClass('disabled');
                }
                else {
                    $(v).parent().removeClass('disabled');
                }
                var val = parseInt($(v).attr('value'));
                if (val == 0)
                    checkElement(settings, $(v), 'door0');
                if (val == 1)
                    checkElement(settings, $(v), 'door1');
                if (val == 2)
                    checkElement(settings, $(v), 'door2');
                if (val == 3)
                    checkElement(settings, $(v), 'door3');
                if (val == 4)
                    checkElement(settings, $(v), 'hood');
                if (val == 5)
                    checkElement(settings, $(v), 'trunk');
            });
            $('.window').each(function (i, v) {
                var val = parseInt($(v).attr('value'));
                if (val == 0)
                    checkElement(settings, $(v), 'windowr1');
                if (val == 1)
                    checkElement(settings, $(v), 'windowl1');
                if (val == 2)
                    checkElement(settings, $(v), 'windowr2');
                if (val == 3)
                    checkElement(settings, $(v), 'windowl2');
            });
            $('#fuelLevel').css('width', settings.fuel + '%');
            $('#damageLevel').css('width', settings.damage + '%');
            $('.veh-name').html('Name: ' + settings.name);
            $('.veh-plate').html('Plate: ' + settings.plate);

            if (settings.engine === true) {
                $(".engine").css('color', '');
                $(".engine").css('background-color', '');
            } else {
                $(".engine").css('color', 'rgb(155, 49, 49)');
                $(".engine").css('background-color', '#0d0808');
            }

            if (settings['engineAccess'] === true) {
                frontPanel = true
            } else {
                frontPanel = false
            }
        }
    });

    $('.door').on('click', function () {
        var doorIndex = $(this).attr('value');
        $.post('http://nocore-vehmenu/openDoor', JSON.stringify({
            doorIndex: doorIndex
        })
        );
    });

    $('.seat').on('click', function () {
        var seatIndex = $(this).attr('value');
        $.post('http://nocore-vehmenu/switchSeat', JSON.stringify({
            seatIndex: seatIndex
        })
        );
    });

    $('.close').on('click', function () {
        $.post('http://nocore-vehmenu/escape', JSON.stringify({})
        );
    });

    $('.alldoor').on('click', function () {
        if (frontPanel === true) {
            $.post('http://nocore-vehmenu/togglealldoor', JSON.stringify({}));
        }
    });

    $('.lockdoors').on('click', function () {
        if (frontPanel === true) {
            $.post('http://nocore-vehmenu/lockdoors', JSON.stringify({}));
        }
    });

    $('.givekeys').on('click', function () {
        $.post('http://nocore-vehmenu/givekeys', JSON.stringify({}));
    });

    $('.roof').on('click', function () {
        if (frontPanel === true) {
            $.post('http://nocore-vehmenu/convertroof', JSON.stringify({}));
        }
    });

    $('.window').on('click', function () {
        var windowIndex = $(this).attr('value');
        $.post('http://nocore-vehmenu/togglewindow', JSON.stringify({
            windowIndex: windowIndex
        })
        );
    });

    $('.engine').on('click', function () {
        if (frontPanel === true) {
            $.post('http://nocore-vehmenu/toggleengine', JSON.stringify({}));
        }
    });

    document.onkeyup = function (data) {
        if (open) {
            if ((
                data.which == 90) ||
                data.which == 27
            ) {
                $.post('http://nocore-vehmenu/escape', JSON.stringify({}));
            }
        }
    };

});
