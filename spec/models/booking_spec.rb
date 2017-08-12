require "rails_helper"
RSpec.describe Booking, type: :model do
  it "has a valid factory" do
    expect(build(:booking)).to be_valid
  end

  let(:booking) { build(:booking) }
  let(:flight) { build(:flight) }
  let(:passenger) { build(:passenger) }

  describe "instance methods" do
    context "respond to instance method calls" do
      it { expect(booking).to respond_to(:booking_reference) }
      it { expect(booking).to respond_to(:booking_fee) }
      it { expect(booking).to respond_to(:passenger_email) }
    end
  end
end
