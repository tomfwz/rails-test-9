require 'rails_helper'

describe Post do
  context 'validations' do
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :user_id }
  end

  context 'associations' do
    it { is_expected.to have_many :comments }
    it { is_expected.to belong_to :user }
  end
end
