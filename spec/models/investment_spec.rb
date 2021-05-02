# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Investment do
  let(:investment) { create(:investment) }

  subject { investment }
  describe 'validations' do
    it { is_expected.to be_valid }
  end
end
