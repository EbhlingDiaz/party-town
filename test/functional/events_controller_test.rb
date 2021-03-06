require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @event = FactoryGirl.create(:event)
    @user   = FactoryGirl.create(:user)
    @user.confirm!
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: {
      address_line_1: @event.address_line_1,
      address_line_2: @event.address_line_2,
      city:           @event.city,
      latitude:       @event.latitude,
      longitude:      @event.longitude,
      title:          @event.title,
      when:           @event.when,
      hashtag:        @event.hashtag
    }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
