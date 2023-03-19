var CurrentSkin = 0
var NormalSkins = {
    "Default/Black": '800px-Wtint_0',
    "Green": '800px-Wtint_1',
    "Gold": '800px-Wtint_2',
    "Pink": '800px-Wtint_3',
    "Army": '800px-Wtint_4',
    "LSPD": '800px-Wtint_5',
    "Orange": '800px-Wtint_6',
    "Platinum": '800px-Wtint_7',
}
let Mk2Skins = {
    "Classic Black": 'Mk2_wtint_0',
    "Classic Gray": 'Mk2_wtint_1',
    "Classic Two-Tone": 'Mk2_wtint_2',
    "Classic White": 'Mk2_wtint_3',
    "Classic Beige": 'Mk2_wtint_4',
    "Classic Green": 'Mk2_wtint_5',
    "Classic Blue": 'Mk2_wtint_6',
    "Classic Earth": 'Mk2_wtint_7',
    "Classic Brown & Black": 'Mk2_wtint_8',
    "Red Contrast": 'Mk2_wtint_9',
    "Blue Contrast": 'Mk2_wtint_10',
    "Yellow Contrast": 'Mk2_wtint_11',
    "Orange Contrast": 'Mk2_wtint_12',
    "Bold Pink": 'Mk2_wtint_13',
    "Bold Purple & Yellow": 'Mk2_wtint_14',
    "Bold Orange": 'Mk2_wtint_15',
    "Bold Green & Purple": 'Mk2_wtint_16',
    "Bold Red Features": 'Mk2_wtint_17',
    "Bold Green Features": 'Mk2_wtint_18',
    "Bold Cyan Features": 'Mk2_wtint_19',
    "Bold Yellow Features": 'Mk2_wtint_20',
    "Bold Red & White": 'Mk2_wtint_21',
    "Bold Blue & White": 'Mk2_wtint_22',
    "Metallic Gold": 'Mk2_wtint_23',
    "Metallic Platinum": 'Mk2_wtint_24',
    "Metallic Gray & Lilac": 'Mk2_wtint_25',
    "Metallic Purple & Lime": 'Mk2_wtint_26',
    "Metallic Red": 'Mk2_wtint_27',
    "Metallic Green": 'Mk2_wtint_28',
    "Metallic Blue": 'Mk2_wtint_29',
    "Metallic White & Aqua": 'Mk2_wtint_30',
    "Metallic Red & Yellow": 'Mk2_wtint_31',
}

function Display(bool) {
    if(bool) {
        $("#menu").fadeIn(500);
    } else {
        $("#menu").fadeOut(500);
    }
}

$(function() {
    Display(false);

    window.addEventListener('message', function(event) {
        var item = event.data;
        switch(item.type) {
            case "open":
                Display(true)
                GiveSkins(item.mk2)
                break;
            case "close":
                $.post(`http://nocore-spraykit/close`)
                Display(false)
                break;
        }
    })

    document.onkeyup = function(data) {
        if(data.which === 27) {
            Display(false)
            $.post(`http://nocore-spraykit/close`)
        }
    }
})

function GiveSkins(mk2) {
    $("#sidebar").html('');
    if (mk2) {
        var index = -1
        $.each(Mk2Skins, function(name, url){
            index++
            var Element = '<a index = '+index+' image = "'+url+'" >'+name+'</a>';
            $("#sidebar").append(Element);
        });
    } else {
        var index = -1
        $.each(NormalSkins, function(name, url){
            index++
            var Element = '<a index = '+index+' image = "'+url+'" >'+name+'</a>';
            $("#sidebar").append(Element);
        });
    }

    $("a[index*=0]").addClass('active');
    $("a[class!='nonclickable']").click(function() {
        $("a[class*='active']").removeClass('active');
        $(this).addClass('active');
        SelectSkin(this);
    });
}


function SelectSkin(skin) {
    var modalImg = document.getElementById("imageshow");
    var scr = 'skins/'+$(skin).attr('image')+'.jpg';
    modalImg.src = scr;
    CurrentSkin = $(skin).attr('index');
}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
}

function coffee() {
    $.post(`http://nocore-spraykit/close`);
    Display(false)
    var spraysound = getRandomInt(1,2)
    var audio = new Audio("spray"+ spraysound +".mp3");
    audio.oncanplaythrough = function(){
        audio.volume = "0.5";
        audio.play();
    }
    $.post('http://nocore-spraykit/SetSkin', JSON.stringify({
        tint: CurrentSkin
    }))
}
