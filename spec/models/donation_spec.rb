require "rails_helper"

RSpec.describe Donation, :type => :model do
  describe "associations" do
    it {is_expected.to belong_to(:event)}
  end

  describe "schema" do
    it {is_expected.to have_db_column(:event_id).of_type(:integer)}
    it {is_expected.to have_db_column(:donors_name).of_type(:string)}
    it {is_expected.to have_db_column(:type).of_type(:string)}
    it {is_expected.to have_db_column(:description).of_type(:text)}
    it {is_expected.to have_db_column(:phone_number).of_type(:string)}
    it {is_expected.to have_db_column(:address).of_type(:string)}

  end
end
