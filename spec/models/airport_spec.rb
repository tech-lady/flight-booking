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

  describe "#iata_name" do
    it "returns a city and iata code" do
      expect(airport.iata_code).to eql("NG")
    end
  end
  
  describe "associations" do
    it "has many flights" do
      expect(airport).to have_many(:flights)
    end
  end
end
