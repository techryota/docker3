require 'rails_helper'
describe GoodEvaluation do
  describe '#create' do
    it "user_id,evaluate_idが存在すれば登録できる" do
      good_evaluation = build(:good_evaluation)
      good_evaluation.valid?
      expect(good_evaluation).to be_valid
    end

  end
end