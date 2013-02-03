//$(document).ready(function (evt) {
//
//  $('.mailing-list').submit(function () {
//    var valuesToSubmit = $(this).serialize();
//    $.ajax({
//      method: 'POST',
//      url:$(this).attr('action'),
//      data:valuesToSubmit,
//      dataType:"JSON"
//    }).success(function (json) {
//          console.log("Data saved: " + json);
//        });
//    return false; // prevents normal behaviour
//  });
//
//});