require 'rails_helper'

describe GroupsController do
  describe 'GET #index' do
    let(:group) { create(:group) }
    it "renders the :new template" do

    end
  end

  describe 'GET #new' do
    let(:group) { create(:group) }
    it "renders the :new template" do

    end

    it "assigns the requested group to @group" do
    
    end
  end

  describe 'Post #create' do
    context "@messageが保存できた時" do

      it "データベースに値が保存される" do
      end

      it "正しいビューに変遷する" do
      end

    end

    context "@messageが保存できなかった時" do

      it "データベースに値が保存されない" do
      end

      it "正しいビューに変遷する" do
      end

    end

  end
end