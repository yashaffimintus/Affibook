jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

// $(function() {
//   $('.user').on('click', function() {
//     var id = $(this).attr('data-id');
//     $.get('user/' + id, function(data) {
//       // Handle the result
//       $('.user-window').html(data);
//     });
//   });
// });