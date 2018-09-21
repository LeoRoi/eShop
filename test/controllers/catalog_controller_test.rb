require 'test_helper'

class CatalogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get catalog_index_url
    assert_response :success
  end

  test "should get index with locale" do
    get catalog_index_url(set_locale: 'en')
    assert_redirected_to catalog_index_url(locale: 'en')
  end

end
