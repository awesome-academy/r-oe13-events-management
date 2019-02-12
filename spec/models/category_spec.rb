require "rails_helper"

RSpec.describe Category, :type => :model do
  describe "association" do
    it {is_expected.to have_many(:user_settings)}
    it {is_expected.to have_many(:category_events)}
    it {is_expected.to have_many(:users).through(:user_settings)}
    it {is_expected.to have_many(:events).through(:category_events)}
  end

  describe "schema database" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:description).of_type(:text)}
  end
end
