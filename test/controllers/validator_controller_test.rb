# encoding: UTF-8
require 'test_helper'
# Validator controller test.
class ValidatorControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end
end
