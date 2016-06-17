class CreateServiceProviders < ActiveRecord::Migration
  def change
    create_table :service_providers do |t|
      t.string  :name, null: false
      t.string  :address
      t.string  :zip
      t.decimal :lat
      t.decimal :lng
      t.string  :place_id
      t.string  :telephone
      t.string  :tty
      t.string  :website
      t.string  :services_offered
      t.string  :populations_served

      t.timestamps null: false
    end
  end
end
