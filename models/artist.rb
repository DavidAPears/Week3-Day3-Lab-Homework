require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :artist_name
  attr_reader :id

  def initialize(options)
    @artist_name = options['artist_name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists
    (
      artist_name
    ) VALUES
    (
      $1
    )
    RETURNING id"
    values = [@artist_id, @artist_name]
    new_artist = SqlRunner.run(sql, values)
    @artist_id = new_artist[0]['id'].to_i
  end





# #
#   def self.delete_all()
#     db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
#     sql = "DELETE FROM pizza_orders"
#     db.prepare("delete_all", sql)
#     db.exec_prepared("delete_all")
#     db.close()
#   end
#
#   def customer()
#     sql = "SELECT * FROM customers WHERE id = $1"
#     values = [@customer_id]
#     customers = SqlRunner.run(sql, values).first
#     return Customer.new(customer)
#   end
#
 end
