

$(".buybutton").click(function(event) {
    event.preventDefault();

    var ItemData = $(this).attr('data-item');
    console.log(ItemData);

    $.post('http://nocore-laptop/buy', JSON.stringify({
        item: ItemData
    }));
    return
})