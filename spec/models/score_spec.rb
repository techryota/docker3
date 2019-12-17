require 'rails_helper'
describe Score do
  describe '#create' do
    it "user_id,group_idが存在すれば登録できる" do
      score = build(:score)
      score.valid?
      expect(score).to be_valid
    end

  end
end