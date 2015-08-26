# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  category_id        :integer
#  brand_id           :integer
#  description        :text
#  price              :decimal(, )
#  quantity           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Product fields must not be empty" do
  	product = Product.new
  	assert_not product.save, "Product saved with empty fields"
  end

  	# assert product.errors[:name].any?, "name must not be empty"
  	# assert product.errors[:category].any?, "category must not be empty"
  	# assert product.errors[:brand_id].any?, "brand_id must not be empty"
  	# assert product.errors[:description].any?, "description must not be empty"
  	# assert product.errors[:price].any?, "price must not be empty"
  	# assert product.errors[:quantity].any?, "quantity must not be empty"

# TODO: Figure out error in this test
  test "Product name should be unique" do
  	product = Product.new(price: 1, description: "text", category_id: 1, brand_id: 1, quantity: 1)
  	product.name = products(:one).name
  	assert_not product.save, "Product saved with duplicate name"
  end


 test "product price must be positive and greater than zero" do
   product = Product.new(name: "stuff", description: "text", category_id: 1, brand_id: 1, quantity: 1)

   product.price = 0
   assert product.invalid?, "invalid price"
   assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

   product.price = 1
   assert product.valid?, "price marked invalid despite valid input"
 end

 test "product saves with all valid fields" do
  	product = Product.new(name: "stuff", description: "text", category_id: 1, brand_id: 1, quantity: 1, price: 1)
  	assert product.save, "Product unsaved despite valid fields"
  end

end
