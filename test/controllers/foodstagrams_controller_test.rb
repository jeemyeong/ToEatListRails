require 'test_helper'

class FoodstagramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foodstagram = foodstagrams(:one)
  end

  test "should get index" do
    get foodstagrams_url
    assert_response :success
  end

  test "should get new" do
    get new_foodstagram_url
    assert_response :success
  end

  test "should create foodstagram" do
    assert_difference('Foodstagram.count') do
      post foodstagrams_url, params: { foodstagram: { img: @foodstagram.img, instagram_id: @foodstagram.instagram_id, tag: @foodstagram.tag } }
    end

    assert_redirected_to foodstagram_url(Foodstagram.last)
  end

  test "should show foodstagram" do
    get foodstagram_url(@foodstagram)
    assert_response :success
  end

  test "should get edit" do
    get edit_foodstagram_url(@foodstagram)
    assert_response :success
  end

  test "should update foodstagram" do
    patch foodstagram_url(@foodstagram), params: { foodstagram: { img: @foodstagram.img, instagram_id: @foodstagram.instagram_id, tag: @foodstagram.tag } }
    assert_redirected_to foodstagram_url(@foodstagram)
  end

  test "should destroy foodstagram" do
    assert_difference('Foodstagram.count', -1) do
      delete foodstagram_url(@foodstagram)
    end

    assert_redirected_to foodstagrams_url
  end
end
