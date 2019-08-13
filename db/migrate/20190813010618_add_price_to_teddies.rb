class AddPriceToTeddies < ActiveRecord::Migration[5.2]
  def change
    add_monetize :teddies, :price
  end
end
