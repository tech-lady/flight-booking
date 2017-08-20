require "rails_helper"

RSpec.describe Flight, type: :model do
  subject :flight do
    create :flight
  end

  describe "instance methods" do
    context "respond to instance method calls" do
      it { expect(flight).to respond_to(:departure_date) }
    end
  end

  describe "associations" do
    it "has many bookings" do
      expect(flight).to have_many(:bookings)
    end
  end
end
