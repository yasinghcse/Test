require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "books")
    @category2 = Category.create(name: "program")
  end

  test "should show category listing" do
    get categories_path
    get_template 'categories/index'
    #search the new data created in setup method in the hyperlinks
    assert_select "a{href=?}", category_path(@category), text: @category.name
    assert_select "a{href = ?}", category_path(@category2), text: @category2.name
    
  end

end
