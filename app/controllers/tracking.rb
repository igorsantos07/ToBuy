ToBuy.controllers :tracking, :parent => :list do
  get :index, :map => 'tracking' do
    @list = List.find params[:list_id]
    render 'tracking/index'
  end

  get :new do
    @tracking_systems = TrackingSystem.all
    render 'tracking/new'
  end

  post :new do
    @tracking_code = TrackingCode.new(params[:tracking_code].merge! :list_id => params[:list_id])
    if @tracking_code.save
      redirect url(:tracking, :index, :list_id => params[:list_id])
    else
      render 'tracking/new'
    end
  end

end