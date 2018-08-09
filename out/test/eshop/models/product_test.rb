require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def setup
    @product = Product.new(description: 'Try a Description',
                           image_url: 'http://www.try/try.jpg',
                           price: '9.8',
                           title: 'tryTitle')
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "title should be present" do
    @product.title = '     '
    assert_not @product.valid?
  end

  test "price should be present" do
    @product.price = '     '
    assert_not @product.valid?
  end

  test "image should be present" do
    @product.image_url = '     '
    assert_not @product.valid?
  end

  test "description should be present" do
    @product.description = '     '
    assert_not @product.valid?
  end

  test "price should not be lesser than 0.1" do
    @product.price = 0.009
    assert_not @product.valid?
  end

  test "price should be numerical" do
    @product.price = 'string'
    assert_not @product.valid?
  end

  test "title should be unique" do
    product = Product.new(title: products(:one).title,
                          description: 'something',
                          price: 1,
                          image_url: "http://www.giao.jpg")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:title]
  end

  test "img_url validation should accept valid addresses" do
    valid_image_url = %w{http://www.giao.it/a.jpg http://ciao.it/a.jpg http://try.com}
    valid_image_url.each do |image_url|
      @product.image_url = image_url
      assert @product.valid?, "#{image_url.inspect} should be valid"
    end
  end

  test "img_url validation should reject valid addresses" do
    invalid_image_url = %w{http://www giao.it/a.jpg http://www.try2}
    invalid_image_url.each do |image_url|
      @product.image_url = image_url
      assert_not @product.valid?, "#{image_url.inspect} should be invalid"
    end
  end
end
