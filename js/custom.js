$(function() {
  $('time').each(function() {
    var time = $(this);
    time.html("about " + moment(time.attr('datetime')).fromNow());
  });
});
