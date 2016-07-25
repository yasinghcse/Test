require 'test_helper'

class ArtilcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artilce = artilces(:one)
  end

  test "should get index" do
    get artilces_url
    assert_response :success
  end

  test "should get new" do
    get new_artilce_url
    assert_response :success
  end

  test "should create artilce" do
    assert_difference('Artilce.count') do
      post artilces_url, params: { artilce: { descp: @artilce.descp, title: @artilce.title } }
    end

    assert_redirected_to artilce_url(Artilce.last)
  end

  test "should show artilce" do
    get artilce_url(@artilce)
    assert_response :success
  end

  test "should get edit" do
    get edit_artilce_url(@artilce)
    assert_response :success
  end

  test "should update artilce" do
    patch artilce_url(@artilce), params: { artilce: { descp: @artilce.descp, title: @artilce.title } }
    assert_redirected_to artilce_url(@artilce)
  end

  test "should destroy artilce" do
    assert_difference('Artilce.count', -1) do
      delete artilce_url(@artilce)
    end

    assert_redirected_to artilces_url
  end
end
