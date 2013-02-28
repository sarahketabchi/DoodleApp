class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end

    add_index :contributors, :user_id
    add_index :contributors, :image_id
  end
end
