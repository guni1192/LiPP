# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  provider    :string
#  uid         :text
#  oauth_token :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }

  it '有効なユーザーのバリデーション' do
    user.name = 'user'
    expect(user).to(be_valid)
  end

  it '空白のユーザーネーム' do
    user.name = '    '
    expect(user).not_to(be_valid)
  end

  it '長過ぎるユーザー名の無効' do
    user.name = 'a' * 51
    expect(user).not_to(be_valid)
  end

  it 'ユーザー名の一意性' do
    create(:user)
    user.name = 'user'
    expect(user).not_to(be_valid)
  end
end
