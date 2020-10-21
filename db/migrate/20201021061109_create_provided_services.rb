class CreateProvidedServices < ActiveRecord::Migration[6.0]
  def change
    create_table :provided_services do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :duration
      t.string :location
      t.string :address
      t.timestamps
      t.references :athlete, foreign_key: true
      t.references :service, foreign_key: true
    end
  end
end
