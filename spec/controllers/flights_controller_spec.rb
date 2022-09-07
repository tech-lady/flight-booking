require "rails_helper"

RSpec.describe FlightsController do
  describe "POST #search" do
    let!(:airports) { create_list(:airport, 2) }

    context "when one or more available flights are found" do
      let!(:flights) { create_list(:flight, 2) }
      let!(:valid_search_params) do
        {
          origin: flights.second.origin_id,
          destination: flights.second.destination_id,
          number_of_passengers: 2,
          departure_date: flights.second.departure_date
        }.with_indifferent_access
      end
      subject { post :search, params: valid_search_params }

      it { expect(Flight.count).to eq(2) }
      it { expect(Flight.search(valid_search_params).count).to eq(1) }
      it "returns the search result with flights" do
        post :search, params: valid_search_params, format: :js
        expect(assigns(:flights)).not_to be_empty
        expect(assigns(:flights).count).to eq(1)
      end
    end

    context "when the search result is empty" do
      let!(:flights) { nil }
      let!(:invalid_search_params) do
        {
          origin: nil,
          destination: nil,
          number_of_passengers: nil,
          departure_date: nil
        }.with_indifferent_access
      end
      subject { post :search, params: invalid_search_params }
      
      it { expect(Flight.count).to eq(0) }     
      it "returns an empty search result" do
        post :search, params: invalid_search_params, format: :js
        binding.pry
        expect(Flight.search(invalid_search_params).count).to eq(0)
      end
    end
  end

  describe "GET #index" do
    subject { get :index }

    context "when there are open flights" do
      let!(:flights) { create_list(:flight, 2) }

      it { expect(Flight.count).to eq(2) }
      it { expect(Flight.open_flights.count).to eq(2) }
      it "returns a list of available flights" do
        get :index
        expect(assigns(:flights).count).to eq(2)
      end
    end

    context "when there is no open flight" do
      it { expect(Flight.open_flights).to be_empty }
      it "returns no flight" do
        get :index
        expect(assigns(:flights)).to be_empty
      end
    end
  end
end
