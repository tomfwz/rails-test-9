require 'rails_helper'

describe HomeController do
  describe '#index' do
    def do_request
      get :index
    end

    let(:user)      { create(:user) }
    let!(:comment)  { create(:comment, user: user) }
    before          { sign_in user }

    it 'renders home#index' do
      do_request
      expect(response).to render_template :index
    end
  end
end