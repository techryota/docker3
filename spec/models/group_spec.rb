require 'rails_helper'
describe Group do
  describe '#create' do
    it "name,date,user_idが存在すれば登録できる" do
      group = build(:group)
      group.valid?
      expect(group).to be_valid
    end

    it "nameが空だと登録されない" do
      group = build(:group, name:nil)
      group.valid?
      expect(group.errors[:name]).to include("を入力してください")
    end
  end
end