class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :address
      t.decimal :lat
      t.decimal :lng

      t.timestamps null: false
    end
  end
end
