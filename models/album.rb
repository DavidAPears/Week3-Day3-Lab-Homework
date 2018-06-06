require('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :album_name, :genre, :customer_id
  attr_reader :id

  def initialize(options)
    @album_name = options['album_name']
    @genre = options['genre']
    @artist_id = options ['artist_id'].to_i
    @id = options['id'].to_i if options['id']
  end

end
  # def save()
  #   db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
  #   sql = "INSERT INTO pizza_orders
  #   (
  #     topping,
  #     quantity,
  #     customer_id
  #   ) VALUES
  #   (
  #     $1, $2, $3
  #   )
  #   RETURNING id"
  #   values = [@topping, @quantity, @customer_id]
  #   db.prepare("save", sql)
  #   @id = db.exec_prepared("save", values)[0]["id"].to_i
  #   db.close()
  # end
  #
  # def self.delete_all()
  #   db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
  #   sql = "DELETE FROM pizza_orders"
  #   db.prepare("delete_all", sql)
  #   db.exec_prepared("delete_all")
  #   db.close()
  # end
  #
  # def customer()
  #   sql = "SELECT * FROM customers WHERE id = $1"
  #   values = [@customer_id]
  #   customers = SqlRunner.run(sql, values).first
  #   return Customer.new(customer)
  # end
