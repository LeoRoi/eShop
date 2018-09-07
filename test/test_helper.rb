require 'simplecov'
SimpleCov.start('rails')
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module MiniTestWithBullet
  require 'minitest/unit'

  def before_setup
    Bullet.start_request
    super if defined?(super)
  end

  def after_teardown
    super if defined?(super)
    Bullet.perform_out_of_channel_notifications if Bullet.notification?
    Bullet.end_request
  end
end

module ActiveSupport
  class TestCase
    include MiniTestWithBullet
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
  end
end

module ActionDispatch
  class IntegrationTest
    def login_as(user)
      post login_url, params: { name: user.name, password: 'secret' }
    end

    def logout
      delete logout_url
    end

    def setup
      login_as users(:one)
    end
  end
end
