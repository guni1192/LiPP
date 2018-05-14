# frozen_string_literal: true

module Api
  module V1
    class ReposController < ApplicationController
      def index
        user = current_user
        client = Octokit::Client.new(access_token: user.oauth_token)
        render json: client.repos.map(&:to_h)
      end

      def show
        user = current_user
        client = Octokit::Client.new(access_token: user.oauth_token)
        render json: client.repository(Integer(params[:id])).to_hash
      end
    end
  end
end
