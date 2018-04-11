class FavoritesSerializer < ActiveModel::Serializer
  attributes :id, :asteroid, :neo_reference_id, :user_id

  def user_id
    object.user.id
  end

  def asteroid
    data = NasaSearchService.find_asteroid(object.neo_reference_id)
    {
      name: data[:name],
      is_potentially_hazardous_asteroid: data[:is_potentially_hazardous_asteroid]
    }
  end
end
