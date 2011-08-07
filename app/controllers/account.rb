ToBuy.controllers :account do
  get :new, :map => 'signup' do
    render 'account/signup'
  end

  post :new, :map => 'signup' do
    unless params[:account]['name'].empty?
      parts = params[:account]['name'].partition ' '
      params[:account]['name'] = parts[0]
      params[:account]['surname'] = parts[2]
    end
    @account = Account.new(params[:account])
    @account.role = 'user'
    if @account.save
      flash[:notice] = 'Conta criada. Você já pode logar com os dados que forneceu!'
      redirect url(:index, :login)
    else
      flash[:warning] = 'Ocorreu um problema ao efetuar o cadastro.'
      render 'account/signup'
    end
  end
end