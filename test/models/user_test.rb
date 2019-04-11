require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "password")

  end

  test "should be valid" do
    assert @user.valid?
  end

  test "user name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "user email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name shouldn't be longer than 50 characters" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email shouldnt be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addreses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn user@example.edu]
    valid_addreses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. user@example..com
                                foo@bar_baz.com foo@bar+baz.com user@example,edu]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "authenticated? should return false for a user with a nil digest" do
    assert_not @user.authenticated?('')
  end


end
