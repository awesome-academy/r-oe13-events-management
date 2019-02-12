require "rails_helper"

RSpec.describe Place, :type => :model do
  describe "associations" do
    it {is_expected.to have_many(:event_places)}
    it {is_expected.to have_many(:events).through(:event_places)}
  end

  describe "schema" do
    it {is_expected.to have_db_column(:latitude).of_type(:string)}
    it {is_expected.to have_db_column(:longitude).of_type(:string)}
    it {is_expected.to have_db_column(:address).of_type(:string)}
  end
end
