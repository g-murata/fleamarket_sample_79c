FactoryBot.define do

  factory :product do
    product_name                {"商品"}
    description                 {"これは商品です"}
    price                       {"2980"}
    product_status              {1}
    prefecture                  {6}
    size                        {"100"}
    shipping_day                {1}
    shipping_type               {1}
    shipping_fee                {2}
    trading_status              {1}
    deal_closed_date            {"2020-08-02 02:00:03.803865"}  
    category                    { create(:category) }
    brand                       { create(:brand) }
    seller                      { create(:seller) }
    
    after (:build) { |product| product.product_images << FactoryBot.build(:product_image) }

  end
  
end

