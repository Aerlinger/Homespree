$(document).ready(function (evt) {
    $('form').submit(function () {
        var valuesToSubmit = $(this).serialize();
        $.ajax({
            url:$(this).attr('action'), //sumbits it to the given url of the form
            data:valuesToSubmit,
            dataType:"JSON" // you want a difference between normal and ajax-calls, and json is standard
        }).success(function (json) {
                //act on result.
            });
        return false; // prevents normal behaviour
    });
});