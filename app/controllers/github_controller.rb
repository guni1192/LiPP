# frozen_string_literal: true

class GithubController < ApplicationController
  def hooks
    project = Project.where(user_id: params[:repository][:owner][:id])
                     .find_by(repo_id: params[:repository][:id])

    project.clone_or_pull

    render json: project
  end
end
