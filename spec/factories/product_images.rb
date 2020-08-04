FactoryBot.define do
  factory :product_image do
    image { File.open("#{Rails.root}/spec/fixtures/test.png") }
  end
end
