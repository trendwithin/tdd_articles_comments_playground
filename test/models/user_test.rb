require "test_helper"

class UserTest < ActiveSupport::TestCase

  def user
    @user ||= User.new(email: 'me@you.com', password: 'password')
  end

  def test_valid
    assert user.valid?
  end

  def test_presence_of_email
    user.email = '     '
    assert_not user.valid?
  end

  def test_maximum_length_of_email_255_chars
    user.email = 'a' * 249 + '@i.com'
    assert user.valid?
  end

  def test_invalid_legnth_of_email_256_chars
    user.email = 'a' * 250 + 'i@.com'
    assert_not user.valid?
  end

  def test_presence_of_password
    user.password = '    '
    assert_not user.valid?
  end

  def test_password_less_then_8_characters
    user.password = '1234567'
    assert_not user.valid?
  end

  def test_update_of_password
    user.update(email: user.email, password: '12345678')
    assert user.valid?
  end
end
