require "test_helper"

class CollectionControllerTest < ActionDispatch::IntegrationTest
  test "should get men" do
    get collection_men_url
    assert_response :success
  end

  test "should get women" do
    get collection_women_url
    assert_response :success
  end

  test "should get kids" do
    get collection_kids_url
    assert_response :success
  end

  test "should get new" do
    get collection_new_url
    assert_response :success
  end
end
