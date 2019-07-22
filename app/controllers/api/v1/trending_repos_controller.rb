class Api::V1::TrendingReposController < ApplicationController

  def index
    # Trending_repo.destroy_all
    # Rails.application.load_seed
    render json: Trending_repo.all
  end

end
