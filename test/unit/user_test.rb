require 'minitest/autorun'

class User < Minitest::Test

  def test_password_failures
  	@user = User.new
    @user.password = "newpass"
    @user.password_confirmation = "testpass"
    assert !@user.save

    @user.password = ""
    @user.password_confirmation = "testpass"
    assert !@user.save

    @user.password = "newpass"
    @user.password_confirmation = "newpass"
    assert @user.save
  end
end