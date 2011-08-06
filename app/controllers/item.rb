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

  get :edit, :map => 'item/:id' do
    @item = Item.find(params[:id])
    render 'item/edit'
  end

  put :edit, :map => 'item/:id' do
    @item = Item.find(params[:id])
    ap @item
    @item.attributes = params[:item]
    ap @item
    if !@item.save
      flash[:warning] = 'Ocorreu um erro ao salvar o item'
    end
    redirect url(:list, :view, :id => @item.list.id)
  end

end