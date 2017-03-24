class AddImageUrlToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :image_url, :string
  end
end
