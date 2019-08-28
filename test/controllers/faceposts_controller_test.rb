require 'test_helper'

class FacepostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facepost = faceposts(:one)
  end

  test "should get index" do
    get faceposts_url
    assert_response :success
  end

  test "should get new" do
    get new_facepost_url
    assert_response :success
  end

  test "should create facepost" do
    assert_difference('Facepost.count') do
      post faceposts_url, params: { facepost: { content: @facepost.content, image: @facepost.image } }
    end

    assert_redirected_to facepost_url(Facepost.last)
  end

  test "should show facepost" do
    get facepost_url(@facepost)
    assert_response :success
  end

  test "should get edit" do
    get edit_facepost_url(@facepost)
    assert_response :success
  end

  test "should update facepost" do
    patch facepost_url(@facepost), params: { facepost: { content: @facepost.content, image: @facepost.image } }
    assert_redirected_to facepost_url(@facepost)
  end

  test "should destroy facepost" do
    assert_difference('Facepost.count', -1) do
      delete facepost_url(@facepost)
    end

    assert_redirected_to faceposts_url
  end
end
