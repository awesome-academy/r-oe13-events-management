require "rails_helper"

RSpec.describe UserSetting, :type => :model do
  describe "accosiations" do
    it {should belong_to(:user)}
    it {should belong_to(:category)}
  end
end
