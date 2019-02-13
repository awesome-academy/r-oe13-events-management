require "rails_helper"

RSpec.describe CategoryEvent, :type => :model do
  describe "associations" do
    it {is_expected.to belong_to(:category)}
    it {is_expected.to belong_to(:event)}
  end

  describe "schema" do
    it {is_expected.to have_db_column(:category_id).of_type(:integer)}
    it {is_expected.to have_db_column(:event_id).of_type(:integer)}
  end
end
