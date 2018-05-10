# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UserController, type: :controller do
  describe 'GET #detail' do
    it 'returns http success' do
      get :detail
      expect(response).to have_http_status(:success)
    end
  end
end
