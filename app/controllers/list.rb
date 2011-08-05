ToBuy.controllers :list do |controller|

  def controller.get_currencies
    currencies = Currency.order(:name).all
    currencies.collect! { |currency| [currency.symbol+' - '+currency.name, currency.id] }
  end

  get :index, :map => 'lists' do
    @lists = List.find_all_by_account_id current_account.id
    render 'list/index'
  end

  get :view, :map => 'list/:id' do
    ap params[:id]
    @list = List.find params[:id]
    render 'list/view'
  end

  get :new do
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

  get :edit, :with => :id do
    @currencies = controller.get_currencies
    @list = List.find(params[:id])
    render 'list/edit'
  end

  put :edit, :with => :id do
    @list = List.find(params[:id])
    @list.attributes = params[:list]
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

  end


end