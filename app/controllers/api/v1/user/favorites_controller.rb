class Api::V1::User::FavoritesController < ApiBaseController

  def index
    render json: Favorite.all, each_serializer: FavoritesSerializer
  end

  def create
    user = ApiKey.find_by(value: params[:api_key]).user
    favorite = Favorite.create!(neo_reference_id: params[:neo_reference_id], user_id: user.id)
    render json: favorite, serializer: FavoritesSerializer
  end

end
