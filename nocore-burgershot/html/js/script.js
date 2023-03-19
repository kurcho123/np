$(document).on('click', '.accept-button', function(e) {
    e.preventDefault();
    var PriceAmount = $(".text-input-price").val();
    var NoteAmount = $(".text-input-note").val();
    $.post('http://nocore-burgershot/Click', JSON.stringify({}))
    if (PriceAmount != '' && PriceAmount != undefined && NoteAmount != '' && NoteAmount != undefined) {
        $.post('http://nocore-burgershot/AddPrice', JSON.stringify({Price: PriceAmount, Note: NoteAmount}))
        $.post('http://nocore-burgershot/CloseNui', JSON.stringify({}))
        $(".main-container").animate({"top": "-30vh"}, 250, function() {
            $(".text-input-price").val('');
            $(".text-input-note").val('');
            $('.item-list').html('');
            $('.main-container').css("display", "none");
         }) 
    } else {
        $.post('http://nocore-burgershot/ErrorClick', JSON.stringify({}))
    }
});

$(document).on('click', '.cancel-button', function(e) {
    e.preventDefault();
    $.post('http://nocore-burgershot/Click', JSON.stringify({}))
    $.post('http://nocore-burgershot/CloseNui', JSON.stringify({}))
    $(".main-container").animate({"top": "-30vh"}, 250, function() {
      $('.main-container').css("display", "none");
   }) 
});

$(document).on('click', '.item-image', function(e) {
    let PriceAmount = Number($(".text-input-price").val());
    let Price = Number(e.target.getAttribute("price"));
    let Bon = $(".text-input-note").val();
    let New = e.target.getAttribute("alt");

    
    
    if (New == 'Clear'){
        $('.item-list').html('');
        $(".text-input-note").val('');
        $(".text-input-price").val('');
        return;
    }
    else if (New == 'Промоция 10%' || New == 'Промоция 20%'){
        let NewPrice = PriceAmount - (PriceAmount * Price);
        let GetPromotion = PriceAmount - NewPrice;
        $(".text-input-price").val(Math.round(NewPrice));
        var AddOption = '<li>'+ New +'</li>';
        $('.item-list').append(AddOption);
    }else{
        let NewPrice = PriceAmount + Price;
        $(".text-input-price").val(Math.round(NewPrice));
        var AddOption = '<li>'+ New +', '+ Price +'$</li>';
        $('.item-list').append(AddOption);
    }

    if (Bon.length == 0) {
        let NewBon = New;
        $(".text-input-note").val(NewBon);
    }else {
        let NewBon = Bon + ', ' + New;
        $(".text-input-note").val(NewBon);
    } 
});

OpenRegister = function() {
  $('.main-container').css("display", "block");
  $('.payment-container').hide()
  $('.menu-items-container').show()
  $('.main-container').css("left", "25%");
  $('.main-container').animate({"top": "15vh"}, 350)
}

// Payment \\

$(document).on('click', '.close-button', function(e) {
    e.preventDefault();
    $.post('http://nocore-burgershot/Click', JSON.stringify({}))
    $.post('http://nocore-burgershot/CloseNui', JSON.stringify({}))
    $(".main-container").animate({"top": "-30vh"}, 250, function() {
      $('.items').html('');
      $('.main-container').css("display", "none");
   }) 
});

$(document).on('click', '.payment', function(e) {
    e.preventDefault();
    var Price = $(this).data('price')
    var Note = $(this).data('note')
    var NumberId = $(this).data('id')
    $.post('http://nocore-burgershot/Click', JSON.stringify({}))
    if (NumberId != null && Note!= null && Price != null) {
        $.post('http://nocore-burgershot/PayReceipt', JSON.stringify({Price: Price, Note: Note, Id: NumberId}))
        $.post('http://nocore-burgershot/CloseNui', JSON.stringify({}))
        $(".main-container").animate({"top": "-30vh"}, 250, function() {
            $('.items').html('');
            $('.main-container').css("display", "none");
         }) 
    } else {
        $.post('http://nocore-burgershot/ErrorClick', JSON.stringify({}))
    }
});

SetupPayments = function(data) {
    for (const [key, value] of Object.entries(data)) {
        if (value != undefined && value != null) {
            var CurrentId = key
            var AddOption = '<div class="payment" data-price='+value['Price']+' data-note="'+value['Note']+'" data-id='+CurrentId+'><p>Касов Бон <br>Обща сума: '+value['Price']+'$<br> Продукти: '+value['Note']+'</p></div>'
            $('.items').append(AddOption);
        }
    }
}

OpenPayment = function() {
 $('.main-container').css("display", "block");
 $('.menu-items-container').hide()
 $('.payment-container').show()
 $('.main-container').css("left", "60%");
 $('.main-container').animate({"top": "30vh"}, 350)
}

window.addEventListener('message', function(event) {
    switch(event.data.action) {
        case "OpenRegister":
          OpenRegister();
          break;
        case "OpenPayment":
            SetupPayments(event.data.payments);
            OpenPayment();
        break;
    }
});