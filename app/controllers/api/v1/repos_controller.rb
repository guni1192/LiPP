# frozen_string_literal: true

module Api
  module V1
    class ReposController < ApplicationController
      def index
        user = current_user
        client = Octokit::Client.new(access_token: user.oauth_token)
        render json: client.repos
      end

      def show; end
    end
  end
end
