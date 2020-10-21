class AddCalendarEntriesReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :entry, foreign_key: true
    add_reference :booking_requests, :entry, foreign_key: true
  end
end
