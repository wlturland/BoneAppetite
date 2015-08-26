# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Category fields must not be empty" do
  	category = Category.new
  	assert_not category.save, "Category saved with empty fields"
  end

  test "Category name must be unique" do
  	category = Category.new
  	category.name = categories(:one).name
  	assert_not category.save, "Category saved with duplicate name"
  end

  test "Category saves with all valid fields" do
  	category = Category.new(name: "unique_category")
  	assert category.save, "Category unsaved despite valid fields"
  end
end
