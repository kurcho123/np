played_sound = false
position = ''

function removeClass() {
	$("#main").removeClass();
	$("#wrapper").removeClass();
}

window.addEventListener('message', function(event) {
	var sound = new Audio('sound.mp3');
	sound.volume = 0.5;

	if (event.data.action == 'open') {
		position = event.data.position;
		message = event.data.message;

		$('#message').html(message);

		if (position == 'right') {
			$('#ui').css('left', '');
			$('#ui').css('right', '1%');
			$('#ui').removeClass('hideright');
			$('#ui').addClass('showright');
		} 
		if (position == 'left') {
			$('#ui').css('right', '');
			$('#ui').css('left', '1%');
			$('#ui').removeClass('hideleft');
			$('#ui').addClass('showleft');
		}   
        
		if(event.data.color == 'darkgreen') { // Dark Green
			removeClass();
			$('#main').addClass('darkgreen-icon');
			$('#wrapper').addClass('darkgreen');
		} else if (event.data.color == 'darkred') { // Dark Red
			removeClass();
			$('#main').addClass('darkred-icon');
			$('#wrapper').addClass('darkred');
		} else if (event.data.color == 'purple') { // Purple
			removeClass();
			$('#main').addClass('purple-icon');
			$('#wrapper').addClass('purple');
		}

		if (played_sound == false) {
			//sound.play();
			played_sound = true;
		}

	} else if (event.data.action == 'close') {

		if (position == 'right') {
			$('#ui').removeClass('hideleft');
			$('#ui').removeClass('showleft');
			$('#ui').removeClass('showright');
			$('#ui').addClass('hideright');
		} 

		if (position == 'left') {
			$('#ui').removeClass('hideright');
			$('#ui').removeClass('showright');
			$('#ui').removeClass('showleft');
			$('#ui').addClass('hideleft');
		}
	}

	played_sound = false;
})

