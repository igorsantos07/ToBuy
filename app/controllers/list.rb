ToBuy.controllers :list do
  get :index do
    @lists = List.find_all_by_account_id current_account.id
    render 'list/index'
  end

  get :view, :with => :id, :priority => :low do
    @list = List.find params[:id]
    render 'list/view'
  end

  get :new do
    @currencies = Currency.order(:name).all
    @currencies.collect! { |currency| [currency.symbol+' - '+currency.name, currency.id] }
    render 'list/new'
  end

  post :new do
    @list = List.new(params[:list])
    @list.account_id = current_account.id
    if @list.save
      redirect url(:list, :view, :id => @list.id)
    else
      render 'list/index'
    end
  end

  get :edit, :with => :id do

  end

  post :edit, :with => :id do

  end

  get :delete, :with => :id do
    if List.find(params[:id]).destroy
      flash[:notice] = 'Lista removida'
    else
      flash[:error] = 'Ocorreu um problema ao apagar a lista. Tente mais tarde.'
    end
    redirect url(:list, :index)
  end

  get :bought, :with => :id do

  end

end