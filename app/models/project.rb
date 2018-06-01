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
  include Git
  include Container

  validates :user_id, presence: true
  validates :repo_id, presence: true, uniqueness: true

  after_save :init_client

  private

  def repository
    init_client
    @client.repository(repo_id)
  end

  def init_client
    user = deployer
    @client = Octokit::Client.new(access_token: user.oauth_token)
  end

  def deployer
    User.find_by(uid: user_id)
  end
end
