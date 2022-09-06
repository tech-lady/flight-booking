require "rails_helper"

RSpec.describe Country, type: :model do
  subject :country do
    create :country
  end

  describe "associations" do
    it "has many states" do
      expect(country).to have_many(:states)
    end
  end
end
