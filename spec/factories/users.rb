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

FactoryBot.define do
  factory :user do
    name "user"
    provider "github"
    uid "1234567890"
    oauth_token "qwerty"
  end
end
