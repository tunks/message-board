class ChangePostContent < ActiveRecord::Migration[7.2]
  def change
      change_column :posts, :content, :text
  end
end
