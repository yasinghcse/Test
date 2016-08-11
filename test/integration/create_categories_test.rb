require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
def setup
    @user = User.create(username: "test", email: "test@gmail.com", password: "password", admin: true)
  end

#test the creation of a new category
  test "get new category form and create category" do
    #use a method to virtual sign in and define the method in test_helper.rb
    sign_in_as(@user,"password")
    #go to the new page to create a category
    get new_category_path
    #load the template
    assert_template 'categories/new'
    #check if any entry is created by the post method
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end 
    #go to index page
    assert_template 'categories/index'
    #check if new article is present on the page
    assert_match "sports", response.body 
  end

#test failiure scenario for the creation of a new category
  test "failure for create category" do
    sign_in_as(@user,"password")
    get new_category_path
    assert_template 'categories/new'
    #pass if no entry is created by the post method
    assert_no_difference 'Category.count' do
      #pass the argument as empty- which would have failed
      post categories_path, category: {name: ""}
    end 
    #go to new page as the error would have occured
    assert_template 'categories/new'
    #check if new article is present on the page 
    #check of tag with the class name
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end


end