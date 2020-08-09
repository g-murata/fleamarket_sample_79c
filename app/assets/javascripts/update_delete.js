$(function() {

  //***************画像差し替え***************//
  $('#img0').click(function() {
    // alert("Hello World");
    $('#product_images_attributes_0_image').click();    
    $('#product_product_images_attributes_0__destroy').prop('checked', false);
    $('#Delete_btn0').fadeIn(2000);
  })


  $('#SecondContent1 img').click(function() {
    // alert("Hello World");
    $('#product_images_attributes_1_image').click();    
    $('#product_product_images_attributes_1__destroy').prop('checked', false);
    $('#Delete_btn1').fadeIn(2000);
  })

  $('#SecondContent2 img').click(function() {
    // alert("Hello World");
    $('#product_images_attributes_2_image').click();    
    $('#product_product_images_attributes_2__destroy').prop('checked', false);
    $('#Delete_btn2').fadeIn(2000);
  })

  $('#SecondContent3 img').click(function() {
    
    $('#product_images_attributes_3_image').click();   
    $('#product_product_images_attributes_3__destroy').prop('checked', false); 
    $('#Delete_btn3').fadeIn(2000);
  })


    //***************画像削除**************//
  $('#Delete_btn0').click(function() {
    $('#product_product_images_attributes_0__destroy').prop('checked', true);
    $('.LeftContents__FirstContent__img img').attr('src', '/assets/trading.png');
    $('#Delete_btn0').hide();
  })

  $('#Delete_btn1').click(function() {
    $('#product_product_images_attributes_1__destroy').prop('checked', true);
    $('#SecondContent1 img').attr('src', '/assets/icon_camera.gif');
    $('#Delete_btn1').hide();
  })

  $('#Delete_btn2').click(function() {
    $('#product_product_images_attributes_2__destroy').prop('checked', true);
    $('#SecondContent2 img').attr('src', '/assets/icon_camera.gif');
    $('#Delete_btn2').hide();
  })

  $('#Delete_btn3').click(function() {
    $('#product_product_images_attributes_3__destroy').prop('checked', true);
    $('#SecondContent3 img').attr('src', '/assets/icon_camera.gif');
    $('#Delete_btn3').hide();
  })


});