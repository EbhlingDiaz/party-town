require 'test_helper'

class EventsTest < ActionDispatch::IntegrationTest  
  def sign_in user
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "test_password"

    click_button "Sign in"
  end

  test "index responds to json requests" do
    get "/events.json"

    assert_response :success
  end

  test "creation of an event" do
    #create a test user
    user = FactoryGirl.create(:user)
    user.confirm!

    sign_in user
    
    visit new_event_path

    fill_in "Title",          with: "SHDH Cd del Carmen"
    fill_in "Hashtag",        with: "#shdhcme"
    fill_in "Address line 1", with: "Calle 31 Num. 54"
    fill_in "Address line 2", with: "Colonia Centro"
    fill_in "City",           with: "Ciudad del Carmen"

    click_button "Save"

    event = Event.where(hashtag: "#shdhcme")

    assert_equal 1, event.count
  end
end
