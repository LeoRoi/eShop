require 'test_helper'

class AboutTest < ActionDispatch::IntegrationTest
  test 'about page' do
    get about_path
    assert_select '#about_title', count: 1
    assert_select '#about_subtitle', count: 1
    assert_select '#about_description', count: 1
    assert_select '#carousel', count: 1

  end
end
