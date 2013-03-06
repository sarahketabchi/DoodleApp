class AddPrivacyToImages < ActiveRecord::Migration
  def change
    add_column :images, :privacy, :string, :default => "public"
  end
end
