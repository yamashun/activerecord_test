class SmsUserRegistrationController < ApplicationController

  def new
    session[:token] = 'EUZq4yi1GGqxYElcupCXsw'
    @verify_form = UserVerifyForm.new
  end

  def verify
    @verify_form = UserVerifyForm.new(verify_params)
    if session[:token] && @verify_form.valid?
      token = Token.find_by(token: session[:token])
      if @verify_form.verify?(token)
        render action: 'complete'
      else
        render action: 'new'
      end
    else
      render action: 'new'
    end
  end

  private
    def verify_params
      params.require(:verfy_form).permit(:first_name, :last_name, :car_number)
    end
end
