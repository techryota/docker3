require 'rails_helper'
describe Count do
  describe '#create' do
    it "user_id,group_idが存在すれば登録できる" do
      count = build(:count)
      count.valid?
      expect(count).to be_valid
    end

  end
end