# frozen_string_literal: true

class GithubController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def hooks
    project = Project.where(user_id: params[:repository][:owner][:id])
                     .find_by(repo_id: params[:repository][:id])

    render json: project

    project.clone_or_pull
    project.deploy
  end
end
