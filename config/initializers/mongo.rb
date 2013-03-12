include Mongo

connection = Mongo::Connection.from_uri("mongodb://dave:dave@ds051077.mongolab.com:51077/todos_development")

MongoMapper.connection = connection
MongoMapper.database = connection.db("todos_development").name