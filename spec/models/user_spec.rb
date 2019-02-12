require "rails_helper"

RSpec.describe User, :type => :model do
  describe "schema" do
    context "columns" do
      it {is_expected.to have_db_column(:email).of_type(:string)}
      it {is_expected.to have_db_column(:name).of_type(:string)}
      it {is_expected.to have_db_column(:phone_number).of_type(:string)}
      it {is_expected.to have_db_column(:avatar).of_type(:string)}
      it {is_expected.to have_db_column(:address).of_type(:string)}
      it {is_expected.to have_db_column(:role_id).of_type(:integer)}
      it {is_expected.to have_db_column(:encrypted_password).of_type(:string)}
      it {is_expected.to have_db_column(:reset_password_token).of_type(:string)}
    end
  end

  describe "accosiations" do
    it {is_expected.to have_many(:user_settings)}
    it {is_expected.to have_many(:categories).through(:user_settings)}
    it {is_expected.to have_many(:user_events)}
    it {is_expected.to have_many(:notifications)}
    # it {is_expected.to have_many(:events).through([:user_events, :notifications])}
    it {is_expected.to have_many(:comments)}
    it {is_expected.to have_many(:posts).through(:comments)}
  end

end
