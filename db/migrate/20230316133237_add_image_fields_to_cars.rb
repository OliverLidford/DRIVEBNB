class AddImageFieldsToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :image, :string
    add_column :cars, :cloudinary_id, :string
    add_column :cars, :image_url, :string
  end
end
