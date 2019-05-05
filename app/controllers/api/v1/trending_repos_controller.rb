class Api::V1::TrendingReposController < ApplicationController

  def index
    render json: Trending_repo.all
  end

end
