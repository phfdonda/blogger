class AddPaperclipFieldsToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :image_file_name,    :string
    add_column :articles, :image_content_type, :string
    add_column :articles, :image_file_size,    :integer
    add_column :articles, :image_updated_at,   :datetime
    add_column :articles, :author_id,          :integer
  end
end
