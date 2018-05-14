# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        projects = Project.where(user_id: User.first.uid)
        render json: projects
      end

      def show
        project = Project.find(params[:id])
        render json: project.github_info
      end

      def create
        project = Project.new(
          user_id: User.first.uid,
          repo_id: params[:repo_id]
        )
        project.save if project.valid?
      end

      def destroy
        Project.find(params[:id]).delete
      end
    end
  end
end
