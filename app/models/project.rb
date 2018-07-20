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
  validates :expose,  uniqueness: true

  before_validation do
    repo = repository
    self.name = repo[:name]
    self.full_name = repo[:full_name]
    self.gh_user = repo[:owner][:login]
  end

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
