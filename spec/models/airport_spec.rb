require "rails_helper"

RSpec.describe Airport, type: :model do
  subject :airport do
    create :airport
  end

  describe "instance metods" do
    context "respond to instance method calls" do
      it { expect(airport).to respond_to(:name) }
      it { expect(airport).to respond_to(:city) }
      it { expect(airport).to respond_to(:iata_code) }
    end
  end

  describe "associations" do
    it "has many departure routes" do
      expect(airport).to have_many(:departure_routes)
    end

    it "has many arrival routes" do
      expect(airport).to have_many(:arrival_routes)
    end
  end

  describe "#iata_name" do
    it "returns a city and iata name" do
      expect(airport.iata_name).to eql("Abuja (ABV)")
    end
  end
end
