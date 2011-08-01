ToBuy.controllers :item, :parent => :list do
  get :new do
    @list_id = params[:list_id]
    @item = Item.new
    render 'item/new'
  end

  post :new do
    @item = Item.new(params[:item].merge! :list_id => params[:list_id])
    @item.list_id =
    if @item.save
      redirect url(:list, :view, :id => @item.list_id)
    else
      render 'list/index'
    end
  end

  get :edit do
    
  end

end