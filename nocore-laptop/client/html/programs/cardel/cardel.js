$(function () {
  openPage(0)
  $("a[class!='nonclickable']").click(function() {
    $("a[class*='active']").removeClass('active');
    $(this).addClass('active');
    itemIndex = $(this).attr('index') -1;
    if (itemIndex == 0) {
      $("#header-c").html("");
      $('#header-c').append(`
      <div id="user">
        <img src="https://pbs.twimg.com/media/DmMS2uRUwAAvG-s.jpg">
        <div id="userplate">
          Ian Jonas
        </div>
      </div>`);
  } else if (itemIndex == 1) {
      $("#header-c").html("");
      $('#header-c').append(`
      <div id="user">
        <img src="https://static.wikia.nocookie.net/32d93cd7-2b37-443b-86e3-7964b78cc7f1/scale-to-width/370">
        <div id="userplate">
          Iosephus Jonna
        </div>
      </div>`);
  } else if (itemIndex == 2) {
      $("#header-c").html("");
      $('#header-c').append(`
      <div id="user">
        <img src="https://i.pinimg.com/564x/47/c8/77/47c87705ab38c9d8d66384a7080274ac.jpg">
        <div id="userplate">
          Paulo Kartikeya
        </div>
      </div>`);
  } else if (itemIndex == 3) {
      $("#header-c").html("");
      $('#header-c').append(`
      <div id="user">
        <img src="https://imgur.com/nVwpPoW.png">
        <div id="userplate">
          Luben Vedat
        </div>
      </div>`);
  }
    openPage(itemIndex);
  });
})

function openPage(itemIndex) {
    let count
    let pages = [];
    $('a[index]').each(function(index) {
        count++;
        pages.push($('div[pageIndex=' + index + ']'));
    });
    $.each(pages, function(index, value) {
        value.hide();
    });
    pages[itemIndex].show();
}

$("#startcardelivery").click(function () {
  $.post('http://nocore-cardeliverys/startcardeliverys', JSON.stringify({}));
  return
})

$("#startarth").click(function () {
  $.post('http://nocore-heists/StartArtH', JSON.stringify({}));
  return
})