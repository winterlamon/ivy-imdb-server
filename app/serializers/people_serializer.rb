class PeopleSerializer < ActiveModel::Serializer
  attributes :name, :photoUrl, :profileUrl, :mostKnownWork

  def mostKnownWork
      {title: object.title,
      url: object.url,
      rating: object.rating,
      director: object.director}
  end
end
