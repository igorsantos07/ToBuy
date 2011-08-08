ToBuy.controllers :item, :parent => :list do
  get :new do
    @item = Item.new :list_id => params[:list_id]
    render 'item/new'
  end

  post :new do
    @list = List.find params[:list_id]
    params[:item]['price'] = Item.format_price(params[:item]['price'], @list.currency.symbol) unless params[:item]['price'].empty?
    @item = Item.new(params[:item].merge! :list_id => params[:list_id])
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
    params[:item]['price'] = Item.format_price(params[:item]['price'], @item.list.currency.symbol) unless params[:item]['price'].empty?
    @item.attributes = params[:item]
    if !@item.save
      flash[:warning] = 'Ocorreu um erro ao salvar o item'
    end
    redirect url(:list, :view, :id => params[:list_id])
  end

  get :delete, :with => :id do
    if Item.find(params[:id]).destroy
      flash[:notice] = 'Item removido'
    else
      flash[:error] = 'Ocorreu um problema ao apagar o item. Tente mais tarde.'
    end
    redirect url(:list, :view, :id => params[:list_id])
  end

end