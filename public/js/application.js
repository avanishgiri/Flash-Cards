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
      if(response == 'hello')
        window.location.href = "/";
      else
        $('.flash_box').html(response).slideDown();
    });
  });
});
