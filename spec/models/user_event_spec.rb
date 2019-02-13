require "rails_helper"

RSpec.describe UserEvent, :type => :model do
  describe "associations" do
    it {is_expected.to belong_to(:event)}
    it {is_expected.to belong_to(:user)}
  end

  describe "schema" do
    it {is_expected.to have_db_column(:event_id).of_type(:integer)}
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    it {is_expected.to have_db_column(:status).of_type(:integer)}
  end
end
