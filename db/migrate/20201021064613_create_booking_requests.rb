class CreateBookingRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_requests do |t|
      t.string :status, default:'In Cart'
      t.references :client, foreign_key: true
      t.references :entry, foreign_key: true
      t.references :provided_service, foreign_key: true
      t.string :note
      t.datetime :booking_date
      t.boolean :completed_by_client, default: false
      t.boolean :completed_by_athlete, default: false
      t.timestamps
    end
  end
end
