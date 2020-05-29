class AddAuthorNameToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :author_name, :string
  end
end
