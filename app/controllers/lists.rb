ToBuy.controllers :lists do
  get :index, :map => "/lists" do
    @lists = List.find_all_by_account_id current_account.id
    render 'lists/index', :format => :html5
  end

  get :list, :with => :id do
    @list = List.find params[:id]
  end

  post :new do

  end

end