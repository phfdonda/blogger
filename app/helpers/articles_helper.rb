module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body, :author_id, :tag_list, :image)
  end
end
