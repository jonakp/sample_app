require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: "",
                                        email: "user@invalid",
                                        password: "foo",
                                        password_confirmation: "bar" } }
    end
    assert_template 'users/new'
#    assert_select "div.col-md-6" do
      assert_select 'form[action="/signup"]'
#    end
    assert_select "div#error_explanation" do
      assert_select "div.alert-danger", /The form contains.*/
      assert_select "ul" do
        assert_select "li", count: 4
      end
    end
    assert_select "div.field_with_errors"
  end

end
