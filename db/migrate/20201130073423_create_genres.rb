class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.boolean :is_active
      t.timestamp :created_at
      t.timestamp :update_at

      t.timestamps
    end
  end
end
