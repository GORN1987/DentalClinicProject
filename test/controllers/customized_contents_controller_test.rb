require 'test_helper'

class CustomizedContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customized_content = customized_contents(:one)
  end

  test "should get index" do
    get customized_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_customized_content_url
    assert_response :success
  end

  test "should create customized_content" do
    assert_difference('CustomizedContent.count') do
      post customized_contents_url, params: { customized_content: { textContent: @customized_content.textContent, title: @customized_content.title } }
    end

    assert_redirected_to customized_content_url(CustomizedContent.last)
  end

  test "should show customized_content" do
    get customized_content_url(@customized_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_customized_content_url(@customized_content)
    assert_response :success
  end

  test "should update customized_content" do
    patch customized_content_url(@customized_content), params: { customized_content: { textContent: @customized_content.textContent, title: @customized_content.title } }
    assert_redirected_to customized_content_url(@customized_content)
  end

  test "should destroy customized_content" do
    assert_difference('CustomizedContent.count', -1) do
      delete customized_content_url(@customized_content)
    end

    assert_redirected_to customized_contents_url
  end
end
