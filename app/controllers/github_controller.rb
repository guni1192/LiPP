# frozen_string_literal: true

class GithubController < ApplicationController
  def hooks
    project = Project.where(user_id: params[:repository][:owner][:id])
                     .find_by(repo_id: params[:repository][:id])

    render json: project

    project.clone_or_pull
  end
end
