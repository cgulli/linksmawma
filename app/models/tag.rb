class Tag

  include DataMapper::Resource

  property :id,       Serial
  property :tag,    String

  belongs_to :link

end
