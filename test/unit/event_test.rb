require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "hashtag must start with a pound sign" do
    event = Event.new(title: "Shdh Cd del Carmen", hashtag: "shdh")  
    assert !event.valid?
  end
end
