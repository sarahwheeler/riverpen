require 'simplecov'
SimpleCov.start
#require 'factory_girl_rails'

require 'capybara/rspec'
require 'capybara/poltergeist'
require 'spork'

#FactoryGirl.find_definitions

RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    config.include Capybara::DSL

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    #config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    #config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    # config.infer_base_class_for_anonymous_controllers = false

    # Otherwise you have to preface all FactoryGirl methods with 'FactoryGirl'
    config.include FactoryGirl::Syntax::Methods

    config.before(:all) do
  		FactoryGirl.reload
		end

    config.before(:each) do
      Capybara.javascript_driver = :poltergeist
      Capybara.current_driver = :poltergeist
      DatabaseCleaner.start
    end

    config.after do
      DatabaseCleaner.clean
    end

    config.filter_run_excluding :performance => true
  end

  def sign_in(user)
    visit login_path
    fill_in 'user_login', with: user.username
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end


  # This code will be run each time you run your specs.
  #FactoryGirl.definition_file_paths = [
  #    Rails.root.join("spec/factories")
  #]
  #config.include FactoryGirl::Syntax::Methods
  #FactoryGirl.definition_file_paths = [
  #	File.expand_path('../factories', __FILE__)
  #]
	

  #to load a particular model:
  load Rails.root.join("app/models/user.rb")

  #load whole app
  Dir[Rails.root + "app/**/*.rb"].each do |file|
    load file
  end