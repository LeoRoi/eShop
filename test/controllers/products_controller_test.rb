require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @product2 = products(:three)
    @def_loc = 'en'
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product:
                                     { description: 'Try a Description',
                                       image_url: 'http://www.try/try.jpg',
                                       price: '9.8',
                                       title: 'tryTitle' } }
    end
    assert_redirected_to product_url(Product.last, locale: @def_loc)
  end

  test "should not create product" do
    assert_no_difference('Product.count') do
      post products_url, params: { product:
                                     { description: 'Try a Description',
                                       image_url: 'http://www.try/try.jpg',
                                       price: 'FalseString',
                                       title: 'tryTitle' } }
    end
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product:
                                             { description: 'Try a Description',
                                               image_url: 'http://www.try/try.jpg',
                                               price: '9.8',
                                               title: 'tryTitle' } }
    assert_redirected_to product_url(@product, locale: @def_loc)
  end

  test "should not update product" do
    patch product_url(@product), params: { product:
                                             { description: 'Try a Description',
                                               image_url: 'http://www.try/try.jpg',
                                               price: 'False String',
                                               title: 'tryTitle' } }
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product2)
    end

    assert_redirected_to products_url(locale: @def_loc)
  end

end
