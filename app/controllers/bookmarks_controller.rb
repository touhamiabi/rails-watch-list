class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end

# <ActionController::Parameters {"authenticity_token"=>"GhmPzH2VvwrqaqeRR0OLXR__SNEgdVn3cnkdkCYyXm8D7QB1Rni8DffJ48j1Rs0I9B3IsdvyUMlzE_MgPflyaw", "bookmark"=>{"movie_id"=>"17", "comment"=>"great!"}, "commit"=>"Create Bookmark", "controller"=>"bookmarks", "action"=>"create", "list_id"=>"1"} permitted: false>
