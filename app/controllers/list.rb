ToBuy.controllers :list do |controller|

  def controller.get_currencies
    currencies = Currency.order(:name).all
    currencies.collect! { |currency| [currency.symbol+' - '+currency.name, currency.id] }
  end

  get :index, :map => 'lists' do
    @lists = current_account.lists.group_by { |list| list.bought }
    render 'list/index'
  end

  get :new do
    @list = List.new
    @currencies = controller.get_currencies
    render 'list/new'
  end

  post :new do
    @list = List.new(params[:list])
    @list.account_id = current_account.id
    if @list.save
      redirect url(:list, :view, :id => @list.id)
    else
      flash[:warning] = 'Ocorreu um erro ao salvar a lista'
      redirect url(:list, :index)
    end
  end

  get :view, :map => 'list/:id' do
    @list = List.find params[:id]
    render 'list/view'
  end

  get :edit, :with => :id do
    @currencies = controller.get_currencies
    @list = List.find(params[:id])
    render 'list/edit'
  end

  put :edit, :with => :id do
    @list = List.find(params[:id])
    params[:list]['final_price'] = Item.format_price(params[:list]['final_price'], @list.currency.symbol) unless params[:list]['final_price'].nil? || params[:list]['final_price'].empty?
    @list.attributes = params[:list]
    @list.final_price = nil if !@list.bought
    if @list.save
      redirect url(:list, :view, :id => @list.id)
    else
      flash[:warning] = 'Ocorreu um erro ao salvar a lista'
      redirect url(:list, :index)
    end
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
    @list = List.find params[:id]
    @list.bought = true
    @list.save
    flash[:notice] = 'Lista marcada como comprada'
    redirect url(:list, :index)
  end


end