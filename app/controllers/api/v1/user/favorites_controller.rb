class Api::V1::User::FavoritesController < ApiBaseController

  def index
    render json: Favorite.all, each_serializer: FavoritesSerializer
  end

  def create

  end

end
