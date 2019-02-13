require "rails_helper"

RSpec.describe Comment, :type => :model do
  describe "associations" do
    it {is_expected.to belong_to(:post)}
    it {is_expected.to belong_to(:user)}
  end

  describe "schema" do
    it {is_expected.to have_db_column(:body).of_type(:text)}
    it {is_expected.to have_db_column(:post_id).of_type(:integer)}
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
  end
end
