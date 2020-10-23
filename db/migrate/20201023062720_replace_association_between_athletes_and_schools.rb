class ReplaceAssociationBetweenAthletesAndSchools < ActiveRecord::Migration[6.0]
  def change
    add_reference :athletes, :school, index: true, foreign_key: true
    remove_reference :schools, :athlete, index: true, foreign_key: true
  end
end
