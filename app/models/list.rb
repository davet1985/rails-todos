class List
  include MongoMapper::Document

  key :title,            String,	:required => true,	:unique => true
  key :description,      String,	:required => true
  timestamps!

end