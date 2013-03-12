class List
  include MongoMapper::Document

  key :title,            String
  key :description,      String
  timestamps!

  validates_presence_of :title
  validates_presence_of :description

end