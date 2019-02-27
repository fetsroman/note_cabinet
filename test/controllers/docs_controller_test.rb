require 'test_helper'

class DocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doc = docs(:one)
  end

  test "should get index" do
    get docs_url
    assert_response :success
  end

  test "should get new" do
    get new_doc_url
    assert_response :success
  end

  test "should create doc" do
    assert_difference('Doc.count') do
      post docs_url, params: { doc: { content: @doc.content, title: @doc.title } }
    end

    assert_redirected_to doc_url(Doc.last)
  end

  test "should show doc" do
    get doc_url(@doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_doc_url(@doc)
    assert_response :success
  end

  test "should update doc" do
    patch doc_url(@doc), params: { doc: { content: @doc.content, title: @doc.title } }
    assert_redirected_to doc_url(@doc)
  end

  test "should destroy doc" do
    assert_difference('Doc.count', -1) do
      delete doc_url(@doc)
    end

    assert_redirected_to docs_url
  end
end
