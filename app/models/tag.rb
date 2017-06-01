class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, Text

  has n, :links, :through => Resource
end
