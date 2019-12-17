require 'rails_helper'
describe User do
  describe '#create' do
    it "nameが空だと登録されない" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "name,email,passwordが存在すれば登録できる" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "emailが空だと登録されない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordが空だと登録されない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "imageが空でも登録できる" do
      user = build(:user, image: nil)
      user.valid?
      expect(user).to be_valid
    end

    it "emailが重複すると登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが6文字以上だと登録できる" do
      user = build(:user, password: "000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以下だと登録されない" do
      user = build(:user, password: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end