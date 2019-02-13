require "rails_helper"

RSpec.describe Post, :type => :model do
  describe "associations" do
    it {is_expected.to belong_to(:event)}
    it {is_expected.to have_many(:comments)}
    it {is_expected.to have_many(:users).through(:comments)}
  end

  describe "schema" do
    it {is_expected.to have_db_column(:body).of_type(:text)}
    it {is_expected.to have_db_column(:title).of_type(:text)}
    it {is_expected.to have_db_column(:event_id).of_type(:integer)}
    it {is_expected.to have_db_column(:thumbnail).of_type(:string)}
  end
end
