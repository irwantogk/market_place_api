require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "User with valid email should be valid!" do
    user = User.new(email: "test@test.com", password_digest: "test")
    assert user.valid?
  end

  test "User with invalid email should be invalid!" do
    user = User.new(email: "test", password_digest: "test")
    assert_not user.valid?
  end

  test "User with taken email should be invalid!" do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: "test")
    assert_not user.valid?
  end
end
