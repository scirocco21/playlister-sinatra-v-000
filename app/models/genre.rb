class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :song_genres
  has_many :artists, through: :songs

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    @genre = self.all.find{|genre| genre.slug == slug}
  end

end
