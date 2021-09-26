class HomesController < ApplicationController
  before_action :authenticate_user!,except: [:index, :about]
end
