require 'rails_helper'
describe Message do
  describe '#create' do
    it "文章が空でも登録できること" do
      message = build(:message, content: nil)
      message.valid?
      expect(message).to be_valid
    end

    it "画像が空でも登録できること" do
      message = build(:message, image: nil)
      message.valid?
      expect(message).to be_valid
    end
  end
end