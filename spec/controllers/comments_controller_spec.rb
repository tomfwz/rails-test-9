require 'rails_helper'

describe CommentsController do
  describe '#new' do
    def do_request
      xhr :get, :new, parent_id: parent_id
    end

    let(:user)        { create(:user) }
    let!(:comment)    { create(:comment, user: user) }
    let!(:parent_id)  { nil }

    before { sign_in user }

    it 'renders comments#new as js' do
      do_request
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    def do_request
      xhr :post, :create, comment: comment
    end

    let(:user)          { create(:user) }
    let!(:root_comment) { create(:comment, user: user, parent_id: nil) }
    let(:comment)       { attributes_for(:comment, parent_id: root_comment.id, user_id: user.id) }
    
    before { sign_in user }
    
    it 'saves a comment' do
      expect { do_request }.to change(Comment, :count).by(1) 
    end

    it 'adds a comment to root comment' do
      expect { do_request }.to change(root_comment.children, :count).by(1) 
    end
  end

  describe '#edit' do
    def do_request
      xhr :get, :edit, id: comment.id
    end

    let(:user)    { create(:user) }
    let(:comment) { create(:comment, parent_id: nil, user_id: user.id) }
    
    before { sign_in user }
    
    it 'renders comments#edit as js' do
      do_request
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    def do_request
      xhr :patch, :update, id: comment.id, comment: comment_params
    end

    let(:user)            { create(:user) }
    let(:comment)         { create(:comment, parent_id: nil, user_id: user.id, message: 'Test') }
    let(:comment_params)  { { message: 'Update message' } }
    
    before { sign_in user }
    
    it 'updates a comment' do
      do_request
      expect(comment.reload.message).to eq 'Update message'
    end

    it 'renders comments#success' do
      do_request
      expect(response).to render_template :success
    end
  end

  describe '#destroy' do
    def do_request
      xhr :delete, :destroy, id: comment.id
    end

    let(:user)      { create(:user) }
    let!(:comment)  { create(:comment, parent_id: nil, user_id: user.id, message: 'Test') }
    
    before { sign_in user }
    
    it 'deletes a comment' do
      expect { do_request }.to change(Comment, :count).from(1).to(0) 
    end
  end
end