require 'test_helper'

class InternationalisationTest < ActionDispatch::IntegrationTest

  test 'english default language' do
    get catalog_index_path
    assert_select '#add_cart_btn', value: "add to cart"
    assert_select '#store_navbar', value: "store"
    assert_select '#cart_navbar', value: "cart"
    assert_select '#about_navbar', value: "about"

    get about_path
    assert_select '#about_title', text: "THE BAND"
    assert_select '#about_subtitle', text: "We love cakes"
  end

  test 'german language' do

  end

end
