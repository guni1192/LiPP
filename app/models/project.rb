# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id         :bigint(8)        not null, primary key
#  repo_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  validates :repo_id, presence: true
  validates :user_id, presence: true

  def github_info
    user = User.find_by(uid: user_id)
    @client = Octokit::Client.new(access_token: user.oauth_token)
    @client.repository(repo_id)
  end
end
