Admin.controllers :tracking_systems do

  get :index do
    @tracking_systems = TrackingSystem.all
    render 'tracking_systems/index'
  end

  get :new do
    @tracking_system = TrackingSystem.new
    render 'tracking_systems/new'
  end

  post :create do
    @tracking_system = TrackingSystem.new(params[:tracking_system])
    if @tracking_system.save
      flash[:notice] = 'TrackingSystem was successfully created.'
      redirect url(:tracking_systems, :edit, :id => @tracking_system.id)
    else
      render 'tracking_systems/new'
    end
  end

  get :edit, :with => :id do
    @tracking_system = TrackingSystem.find(params[:id])
    render 'tracking_systems/edit'
  end

  put :update, :with => :id do
    @tracking_system = TrackingSystem.find(params[:id])
    if @tracking_system.update_attributes(params[:tracking_system])
      flash[:notice] = 'TrackingSystem was successfully updated.'
      redirect url(:tracking_systems, :edit, :id => @tracking_system.id)
    else
      render 'tracking_systems/edit'
    end
  end

  delete :destroy, :with => :id do
    tracking_system = TrackingSystem.find(params[:id])
    if tracking_system.destroy
      flash[:notice] = 'TrackingSystem was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy TrackingSystem!'
    end
    redirect url(:tracking_systems, :index)
  end
end