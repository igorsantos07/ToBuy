ToBuy.controllers :account do
  get :new, :map => 'signup' do
    render 'account/signup'
  end

  post :new, :map => 'signup' do
    ap params
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