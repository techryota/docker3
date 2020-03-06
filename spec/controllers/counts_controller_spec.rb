require 'rails_helper'

describe CountsController do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }
  describe 'GET #index' do
    before do
      login_user user
      # get :index, params: { group_id: group.id }
    end
    it 'redners index' do
      count = Count.new
      get :index, params: { group_id: group.id }
      expect(assigns(:count)).to eq count
    end
  end
end