class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :school_name
      t.timestamps
      t.references :athlete, foreign_key: true
    end
  end
end
