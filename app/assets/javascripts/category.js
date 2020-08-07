$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){
    var childSelectHtml = "";
    childSelectHtml = `<div class="category__child" id="children_wrapper">
                        <select id="child__category" name="product[category_id]" class="second_line">
                          <option value="">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('.Main__right__ThirdContent__Category').append(childSelectHtml);
  }
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = "";
    grandchildSelectHtml = `<div class="category__child" id="grandchildren_wrapper">
                              <select id="grandchild__category" name="product[category_id]" class="select_field">
                                <option value="">---</option>
                                ${insertHTML}
                                </select>
                            </div>`;
    $('.Main__right__ThirdContent__Category').append(grandchildSelectHtml);
  }

  $('#product_category_id').on('change',function(){
    var parentId = document.getElementById('product_category_id').value;
    if (parentId != ""){
      $.ajax({
        url: '/products/get_category_children/',
        type: 'GET',
        data: { parent_id: parentId },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  $('.Main__right__ThirdContent__Category').on('change','#child__category',function(){
    var childId = document.getElementById('child__category').value;
    if(childId != "" && childId != 46 && childId != 47 && childId != 134 && childId != 142 && childId != 147 && childId != 150 && childId != 158){
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  })
});
