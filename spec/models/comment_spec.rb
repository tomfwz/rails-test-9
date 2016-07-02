require 'rails_helper'

describe Comment do
  context 'validations' do
    it { is_expected.to validate_presence_of :message }
    it { is_expected.to validate_presence_of :user_id }
  end

  context 'associations' do
    it { is_expected.to belong_to :parent }
    it { is_expected.to belong_to :user }
  end
end