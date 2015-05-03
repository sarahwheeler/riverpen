require 'test_helper'
require 'minitest/autorun'

class TestUser < Minitest::Test

  def setup
    @user = User.new()
  end

  # User Creation
  def test_empty_user_cannot_save
    assert !@user.save, "Empty user does not save"
  end

  def test_password_confirmation
  	@user = User.new()
    @user.password = "newpass"
    @user.password_confirmation = "testpass"
    assert !@user.save, "User saved with mismatched password confirmation"

    @user.password = ""
    @user.password_confirmation = "testpass"
    assert !@user.save, "User saved with blank password"

    @user.password = "newpass"	
    @user.password_confirmation = ""
    assert !@user.save, "User saved with blank confirmation"
  end

  def test_email_presence
  	@user = User.new(email: "")
  	assert !@user.save, "User saved with blank email"  	
  end

  def test_email_uniqueness
    @bad_user = User.new(email: "beyonce@beyhive.com", username: "bey_fan", password: "password", password_confirmation: "password")
    assert !@bad_user.save
  end

  def test_username_presence
    @user = User.new(username: "")
    assert !@user.save
  end

  def test_username_uniqueness
    @user = User.new(username: "beyonce")
    assert !@user.save
  end

  # Profile Methods
  def test_build_profile
    @user.build_profile
    profile = Profile.where(user_id: @user.id)
    assert !profile.nil?
  end
end










