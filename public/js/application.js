$(document).ready(function() {
  $('body').on("submit", ".stuff", function(e){
    e.preventDefault();
    console.log("hellooo")
    $.ajax({
      type: "POST",
      url: "/answer",
      data: $(this).serialize()
    }).done(function(response){
      console.log(response);
      $('.stuff2').html(response).show();
    });
  });
});
