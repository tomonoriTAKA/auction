class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    # 1つのレコードを取得=>モデル.find(引数)
  end

  def index
    @items = Item.all
    # テーブルからすべてのレコードを取得する=>モデル.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to "/items/#{@item.id}"

  end

  def edit
    @item = Item.find(params[:id])

  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to "/items/#{@item.id}"
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to "/items/"
  end


    private
     def item_params
      params.require(:item).permit(:name,:description,:price,:email,:image_url)
     end
end
