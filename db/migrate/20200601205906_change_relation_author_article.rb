class ChangeRelationAuthorArticle < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :author_id
    add_reference :articles, :author, foreign_key: true
  end
end
