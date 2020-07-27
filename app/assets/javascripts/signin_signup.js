//ボタンをクリックした際の処理。

$(function() {
  
  //*******ログイン画面トップの処理*******//

  //「はじめてご利用になる方」をクリックした際の
  $('.Login_which_one__first_time_use').click(function(){
    $('.Member_registration').fadeIn();     //新規登録画面を表示する
  });

  //「アカウントをお持ちの方」をクリックした際の処理    
  $('.Login_which_one__already_have_account').click(function(){
    $('.Login_which_one').hide();           //ログイン画面内のボタン2つを消す
    $('.Login_form').fadeIn(1000);          //入力フォームを表示する。
  });

  //「はじめてご利用になる方」をクリックした際の処理    
  $('.Login_form__first_use').click(function(){
    $('.Member_registration').fadeIn();
  });    


  //*******新規登録画面の処理*******//

  //新規登録画面「×（閉じる）ボタン」をクリックした際の処理    
  $('.Member_registration__close').click(function(){
    $('.Member_registration').fadeOut();     //新規登録画面を閉じる。
  });

  //「既存IDをお持ちの方はこちら（ログイン）」をクリックした際の処理    
  $('.Member_registration__existing_id').click(function(){
    $('.Member_registration').hide();  //新規登録画面を閉じる

    $('.Login_which_one').hide();      //ログイン画面内のボタン2つを消す
    $('.Login_form').fadeIn(1000);     //入力フォームを表示する。
  });  




  //*******新規登録画面（ウィザード）の処理*******//

  //新規登録画面「×（閉じる）ボタン」をクリックした際の処理（住所登録）
  $('.Address_registration__existing_id').click(function(){
    $('.Address_registration').fadeOut();     //新規登録画面を閉じる。
  });


  //新規登録画面「×（閉じる）ボタン」をクリックした際の処理（住所登録）
  $('.Address_registration__close').click(function(){
    $('.Address_registration').fadeOut();     //新規登録画面を閉じる。
  });  

  //「次へ」をクリックした際の処理    
  $('.Member_registration__submit').click(function(){
    $('.Member_registration').fadeOut();
    $('.Address_registration').fadeIn();
  }); 

});