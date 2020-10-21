class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :city
      t.string :state
      t.string :gender
      t.string :contact_number
      t.string :postal_code
      t.datetime :dob
      t.string :address
      t.string :street
      t.string :profile_image
      t.timestamps
    end
  end
end
