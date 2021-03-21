# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  subject { user }
  describe 'validations' do
    it { is_expected.to be_valid }
  end
end
