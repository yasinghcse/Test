require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "Sports")
    @user = User.create(username: "test", email: "test@gmail.com", password: "password", admin: true)
  end

  test "should get category index" do
    get :index
    assert_response :success    
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "should get catgory show" do
    get(:show, {'id' => @category.id})  
    assert_response :success
  end

  test "admin test" do
    assert_no_difference 'Category.count' do
      post :create, category: { name: "sports"}
    end
    assert_redirected_to categories_path
  end

end
