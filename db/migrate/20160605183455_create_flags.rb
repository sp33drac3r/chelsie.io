class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :user, index: true, foreign_key: true
      t.references :flaggable, polymorphic: true, index: true
      t.string :flaggable_type

      t.timestamps null: false
    end
  end
end
