class Auth::LoginCheckController < ApplicationController
  def check
    user_signed_in? ? head(:ok) : head(:unauthorized)
  end
end