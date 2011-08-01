ToBuy.controller :index do

  get :index, :map => '/' do
    redirect url(:list, :index)
  end

	get :login do
		render '/index/login', nil, :layout => false
	end

	post :create_session, :map => '/create_session' do
    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      redirect '/'
    else
      flash[:warning] = "E-mail ou senha incorreto."
      redirect url(:index, :login)
    end
	end

	get :logout do
    set_current_account(nil)
    redirect url(:index, :login)
	end
end