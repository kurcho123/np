$(function () {
  openPage(0)
  $("a[class!='nonclickable']").click(function() {
    $("a[class*='active']").removeClass('active');
    $(this).addClass('active');
    itemIndex = $(this).attr('index') -1;
    openPage(itemIndex);
  });
})

function openPage(pageN) {
  if (pageN == 0) {
      $("#header-b").html("");
      $('#header-b').append(`<div id="user">
        <img src="https://w7.pngwing.com/pngs/174/296/png-transparent-anonymous-logo-hacktivism-anonymous-mask-white-people-monochrome-thumbnail.png">
        <div id="userplate">
          User#4421
        </div>
      </div>`);
  } else if (pageN == 1) {
      $("#header-b").html("");
      $('#header-b').append(`<div id="user">
        <img src="https://w7.pngwing.com/pngs/174/296/png-transparent-anonymous-logo-hacktivism-anonymous-mask-white-people-monochrome-thumbnail.png">
        <div id="userplate">
          User#1962
        </div>
      </div>`);
  } else if (pageN == 2) {
      $("#header-b").html("");
      $('#header-b').append(`<div id="user">
        <img src="https://w7.pngwing.com/pngs/174/296/png-transparent-anonymous-logo-hacktivism-anonymous-mask-white-people-monochrome-thumbnail.png">
        <div id="userplate">
          User#9716
        </div>
      </div>`);
  } else if (pageN == 3) {
      $("#header-b").html("");
      $('#header-b').append(`<div id="user">
        <img src="https://w7.pngwing.com/pngs/174/296/png-transparent-anonymous-logo-hacktivism-anonymous-mask-white-people-monochrome-thumbnail.png">
        <div id="userplate">
          User#3852
        </div>
      </div>`);
  }
  let count
  let pages = [];
  $('a[index]').each(function(index) {
      count++;
      pages.push($('div[pageIndex=' + index + ']'));
  });
  $.each(pages, function(index, value) {
      value.hide();
  });
  pages[pageN].show();
}

$("#startincasoevent").click(function () {
  $.post('http://nocore-banktruck/startincasoevent');
  return
})