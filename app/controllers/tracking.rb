ToBuy.controllers :tracking, :parent => :list do
  get :index, :map => 'tracking' do
    @list = List.find params[:list_id]
    render 'tracking/index'
  end

  get :new do

  end

  post :new do

  end

end