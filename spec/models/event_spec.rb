require "rails_helper"

RSpec.describe Event, :type => :model do
  describe "associations" do
    it {is_expected.to have_many(:category_events)}
    it {is_expected.to have_many(:categories).through(:category_events)}
    it {is_expected.to have_many(:user_events)}
    it {is_expected.to have_many(:notifications)}
    # it {is_expected.to have_many(:users).through(:user_events)}
    # it {is_expected.to have_many(:users).through(:notifications)}
    it {is_expected.to have_many(:donations)}
    it {is_expected.to have_many(:posts)}
    it {is_expected.to have_many(:event_places)}
    it {is_expected.to have_many(:place).through(:event_places)}
  end

  describe "schema" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:start_date).of_type(:date)}
    it {is_expected.to have_db_column(:end_date).of_type(:date)}
    it {is_expected.to have_db_column(:description).of_type(:text)}
    it {is_expected.to have_db_column(:place_id).of_type(:integer)}
    it {is_expected.to have_db_column(:create_by).of_type(:integer)}
    it {is_expected.to have_db_column(:banner).of_type(:string)}
    it {is_expected.to have_db_column(:status).of_type(:boolean)}
  end
end
