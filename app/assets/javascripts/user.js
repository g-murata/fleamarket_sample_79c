$(function() {
  //プロフィール編集を押した時の挙動
  $('.user-info__container__contents__content__right__top__user-profile').click(function(){
    $('.profile-clicked').fadeIn();
  });

  $('.actions2').click(function(){
    $('.profile-clicked').fadeOut();
  });

  // 表示されたウィンドウのタブをクリックした時の挙動
  $('.profile-clicked__wrapper__contents__content__details__detail li').click(function() {
    let index = $('.profile-clicked__wrapper__contents__content__details__detail li').index(this);
    $('.profile-clicked__wrapper__contents__content__details__detail li').removeClass('active');
    $(this).addClass('active');
    $('.profile-clicked__wrapper__contents__content__details__contents ul').removeClass('show').eq(index).addClass('show');
  });
});

