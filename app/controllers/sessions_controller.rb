class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @form = LoginForm.new
  end

  def create 
    @form = LoginForm.new(login_form_params)
    user = login(@form.email, @form.password)
    if user
      redirect_to root_path, success: 'ログインしました'
    else
      flash.now[:error] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.success')
  end

  private

  def login_form_params
    params.require(:login_form).permit(:email, :password)
  end
end
