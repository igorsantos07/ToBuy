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

  get :edit, :map => 'my-details' do
    render 'account/edit'
  end

  put :edit, :map => 'my-details' do
    current_account.name  = params['account']['name']
    current_account.email = params['account']['email']
    current_account.save
    flash[:notice] = 'Dados salvos!'
    render 'account/edit'
  end

  get :change_password do
    render 'account/change_password'
  end

  put :change_password do
    if current_account.has_password? params['account']['current_password']
      params['account'].delete('current_password')
      current_account.attributes = params['account']
      if current_account.save
        flash[:notice] = 'Senha alterada!'
        redirect url(:index, :index)
      else
        flash[:error] = 'Houve um problema ao salvar a nova senha'
      end
    else
      flash[:error] = 'Senha atual incorreta'
    end
    render 'account/change_password'
  end

  delete :remove do
    if current_account.has_password? params['password']
      current_account.destroy
      set_current_account(nil)
      flash[:notice] = 'Até mais!'
      redirect url(:index, :login)
    else
      flash[:error] = 'Senha incorreta'
      render 'account/edit'
    end
  end
end