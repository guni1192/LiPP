module Api
  module V1
    class UserController < ApplicationController
      def detail
        render json: current_user
      end
    end
  end
end
