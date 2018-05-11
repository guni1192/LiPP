# frozen_string_literal: true

module Api
  module V1
    class UserController < ApplicationController
      def detail
        user = current_user
        client = Octokit::Client.new(access_token: user.oauth_token)
        render json: client.user.to_hash
      end
    end
  end
end
