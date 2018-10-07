require 'test_helper'

class InternationalisationTest < ActionDispatch::IntegrationTest

  test 'english default language' do
    get catalog_index_path
    assert_select '#add_cart_btn[value=?]', 'add to cart'
    assert_select '#store_navbar', text: "Store"
    assert_select '#cart_navbar', text: "Cart"

    get about_path
    assert_select '#about_title', text: "THE BAND"
    assert_select '#about_subtitle', text: "We love cakes"
  end

  test 'german language' do
    @def_loc = 'de'
    get catalog_index_path(locale: @def_loc)
    assert_select '#add_cart_btn[value=?]', 'in den Warenkorb'
    assert_select '#store_navbar', text: "Shop"
    assert_select '#cart_navbar', text: "Warenkorb"

    get about_path(locale: @def_loc)
    assert_select '#about_title', text: "DIE BAND"
    assert_select '#about_subtitle', text: "Wir lieben Kuchen"
  end

end
