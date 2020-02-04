$(function () {
  var ball = $('.ball');
  ball.click(function () {
    $(this).addClass('active');
  });
  var strike = $('.strike');
  strike.click(function () {
    $(this).addClass('active');
  });
  var auto = $('.auto');
  auto.click(function () {
    $(this).addClass('active');
  });
  var reset = $('.reset');
  var btn = $('button')
  reset.click(function () {
    btn.removeClass('active');
  });

  function buildMessageHTML(message) {
    var image = (message.image.url) ? `<img src=${message.image.url} class= "lower-message__image" >` : "";
    var html = `<div class="message" data-id="${message.id}"> 
          <div class="upper-message">
            <div class="upper-message__user-name">
              ${message.user_name}
            </div>
            <div class="upper-message__date">
              ${message.created_at}
            </div>
          </div>
          <div class="lower-meesage">
            <p class="lower-message__content">
              ${message.content}
            </p>
              ${image}
          </div>
        </div>`
    return html;
  };

//   function buildCountHTML(count) {
//     val aaa =`<div class="count-view">
// <div class="ball"></div>
// <div class="ball"></div>
// <div class="ball-emptiness"></div>
// <div class="ball-emptiness"></div>
// <div class="strike-emptiness"></div>
// <div class="strike-emptiness"></div>
// <div class="strike-emptiness"></div>
// <div class="auto"></div>
// <div class="auto-emptiness"></div>
// <div class="auto-emptiness"></div>
// </div>`
//     return aaa;
//   }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(message){
      var html = buildMessageHTML(message);
      $('.messages').append(html);
      $('#new_message')[0].reset();
      $(".form__submit").removeAttr("disabled");
      $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight }, 'fast');
    })
    .fail(function(){
      alert('エラー');
    })
  })

  // $('#new_count').on('submit', function(e){
  //   e.preventDefault();
  //   var formData = new FormData(this);
  //   var url = $(this).attr('action');
  //   $.ajax({
  //     url: url,
  //     type: "POST",
  //     data: formData,
  //     dataType: 'json',
  //     processData: false,
  //     contentType: false
  //   })
  //   .done(function(){
  //     var aaa = buildCountHTML(count);
  //     $('.messages').append(aaa);
  //     $('#new_message')[0].reset();
  //     $(".form__submit").removeAttr("disabled");
  //     $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight }, 'fast');
  //   })
  //   .fail(function(){
  //     alert('エラー');
  //   })
  // })

});

