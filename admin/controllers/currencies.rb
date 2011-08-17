Admin.controllers :currencies do

  get :index do
    @currencies = Currency.all
    render 'currencies/index'
  end

  get :new do
    @currency = Currency.new
    render 'currencies/new'
  end

  post :create do
    @currency = Currency.new(params[:currency])
    if @currency.save
      flash[:notice] = 'Currency was successfully created.'
      redirect url(:currencies, :edit, :id => @currency.id)
    else
      render 'currencies/new'
    end
  end

  get :edit, :with => :id do
    @currency = Currency.find(params[:id])
    render 'currencies/edit'
  end

  put :update, :with => :id do
    @currency = Currency.find(params[:id])
    if @currency.update_attributes(params[:currency])
      flash[:notice] = 'Currency was successfully updated.'
      redirect url(:currencies, :edit, :id => @currency.id)
    else
      render 'currencies/edit'
    end
  end

  delete :destroy, :with => :id do
    currency = Currency.find(params[:id])
    if currency.destroy
      flash[:notice] = 'Currency was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Currency!'
    end
    redirect url(:currencies, :index)
  end
end