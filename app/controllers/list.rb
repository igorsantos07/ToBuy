ToBuy.controllers :lists do
  get :index, :map => "/lists" do
    @lists = List.find_all_by_account_id current_account.id
    render 'lists/index'
  end

  get :view, :map => '/list/:id' do
    @list = List.find params[:id]
    render 'lists/view'
  end

  get :new do
    @currencies = Currency.order(:name).all
    @currencies.collect! { |currency| [currency.symbol+' - '+currency.name, currency.id] }
    render 'lists/new'
  end

  post :new do
    @list = List.new(params[:list])
    @list.account_id = current_account.id
    if @list.save
      redirect url(:lists, :view, :id => @list.id)
    else
      render 'lists/index'
    end
  end

end