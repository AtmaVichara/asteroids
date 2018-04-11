class FavoritesSerializer < ActiveModel::Serializer
  attributes :id, :asteroids, :neo_reference_id, :user_id

  def user_id
    object.users.first.id
  end
  
  def asteroids
    data = NasaSearchService.find_asteroid(object.neo_reference_id)
    {
      name: data[:name],
      is_potentially_hazardous_asteroid: data[:is_potentially_hazardous_asteroid]
    }
  end
end
