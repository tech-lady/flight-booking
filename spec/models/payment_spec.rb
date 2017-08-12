require "rails_helper"

RSpec.describe Payment, type: :model do
  before do
    create :airport
    create :flight
  end

  let :booking do
    create(:booking, user: create(:user, email: "payer@gmail.com"))
  end

  subject :payment do
    create(:payment, booking: booking)
  end

  describe "associations" do
    it "belongs to a booking" do
      expect(payment).to belong_to(:booking)
    end
  end
end
