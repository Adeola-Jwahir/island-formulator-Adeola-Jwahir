class AddCostToIngredients < ActiveRecord::Migration[8.1]
  def change
    add_column :ingredients, :cost, :decimal
    add_column :ingredients, :unit, :string
  end
end
