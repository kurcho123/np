var bolt1 = true
var bolt2 = true
var bolt3 = true
var bolt4 = true

var isunscrewing = false

$(document).ready(function(){

  // LUA event listener
  window.addEventListener('message', function(event) {
      if (event.data.action == 'open') {
        $('#plate').show();
        $('.lt').show();
        $('.lb').show();
        $('.rt').show();
        $('.rb').show();
        bolt1 = true
        bolt2 = true
        bolt3 = true
        bolt4 = true
        $('#number').val(event.data.plate);
      }
  });

  // Close the NUI, ESC
  $(document).keyup(function(e) {
    if (e.keyCode == 27) {
      $('#plate').hide();
      $.post('https://zx-fakeplate/escape', {});
    }
  });

  $(".lt").click(function() {
    if (bolt1 & !isunscrewing) {
      isunscrewing = true
      $(this).addClass('spin');
      bolt1 = false
      var audio = new Audio("assets/sounds/screw.mp3");
      audio.oncanplaythrough = function(){
        audio.volume = "0.3";
        audio.play();
      }
      setTimeout(() => {
        $('.lt').fadeOut(500);
        CheckBolts();
        audio.pause();
        $(this).removeClass('spin');
        isunscrewing = false
      }, 3000);
    }
  });

  $(".lb").click(function() {
    if (bolt2 & !isunscrewing) {
      isunscrewing = true
      bolt2 = false
      $(this).addClass('spin');
      var audio = new Audio("assets/sounds/screw.mp3");
      audio.oncanplaythrough = function(){
        audio.volume = "0.3";
        audio.play();
      }
      setTimeout(() => {
        $('.lb').fadeOut(500);
        CheckBolts();
        audio.pause();
        $(this).removeClass('spin');
        isunscrewing = false
      }, 3000);
    }
  });

  $(".rt").click(function() {
    if (bolt3 & !isunscrewing) {
      isunscrewing = true
      bolt3 = false
      $(this).addClass('spin');
      var audio = new Audio("assets/sounds/screw.mp3");
      audio.oncanplaythrough = function(){
        audio.volume = "0.3";
        audio.play();
      }
      setTimeout(() => {
        $('.rt').fadeOut(500);
        CheckBolts();
        audio.pause();
        $(this).removeClass('spin');
        isunscrewing = false
      }, 3000);
    }
  });

  $(".rb").click(function() {
    if (bolt4 & !isunscrewing) {
      isunscrewing = true
      bolt4 = false
      $(this).addClass('spin');
      var audio = new Audio("assets/sounds/screw.mp3");
      audio.oncanplaythrough = function(){
        audio.volume = "0.3";
        audio.play();
      }
      setTimeout(() => {
        $('.rb').fadeOut(500);
        CheckBolts();
        audio.pause();
        $(this).removeClass('spin');
        isunscrewing = false
      }, 3000);
    }
  });

  function CheckBolts() {
    if (!bolt1 & !bolt2 & !bolt3 & !bolt4) {
      $('#plate').fadeOut(500);
      $.post('https://zx-fakeplate/getlicenseplate', JSON.stringify({
        plate: $('#number').val()
      }));
    }
  };

});
