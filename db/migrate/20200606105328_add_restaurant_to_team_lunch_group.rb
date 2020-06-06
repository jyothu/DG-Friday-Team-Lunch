class AddRestaurantToTeamLunchGroup < ActiveRecord::Migration[5.0]
  def change
  	add_reference :team_lunch_groups, :restaurant, foreign_key: true
  end
end
