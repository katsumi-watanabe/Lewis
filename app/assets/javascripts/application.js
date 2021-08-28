// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require jquery_ujs

//= require activestorage
//= require_tree .
/*global $*/

// image-action

// 投稿一覧ページimage
$(function(){
  $(window).load(function (){
    $('.fadein').each(function(){
      var position = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > position - windowHeight + 200){
        $(function(){
          $('.fadein').each(function(i){
            $(this).delay(i * 200).queue(function(){
              $(this).addClass('active');
            });
          });
        });
      }
    });
  });
});

// topページimage
$(function(){
  $(window).scroll(function (){
    $('.fadein-1').each(function(){
      var position = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > position - windowHeight + 200){
        $(function(){
          $('.fadein-1').each(function(i){
            $(this).delay(i * 200).queue(function(){
              $(this).addClass('active');
            });
          });
        });
      }
    });
  });
});

// ファイルを選択してくださいの削除
  $(function () {
  $('#image').on("change", function () {
    var file = this.files[0];
    const fileName = document.getElementById("file-name");
    if (file != null) {
      fileName.insertAdjacentHTML('afterbegin', file.name);
    }
  });
});

// aboutページのスライドショー
$(function () {
  $(".slider").slick({
    autoplay: true, //自動でスクロール
    autoplaySpeed: 0, //自動再生のスライド切り替えまでの時間を設定
    speed: 5000, //スライドが流れる速度を設定
    cssEase: "linear", //スライドの流れ方を等速に設定
    slidesToShow: 3, //表示するスライドの数
    swipe: false, // 操作による切り替えはさせない
    arrows: false, //矢印非表示
    pauseOnFocus: false, //スライダーをフォーカスした時にスライドを停止させるか
    pauseOnHover: false, //スライダーにマウスホバーした時にスライドを停止させるか
    responsive: [
      {
        breakpoint: 750,
        settings: {
          slidesToShow: 3,
        },
      },
    ],
  });
});