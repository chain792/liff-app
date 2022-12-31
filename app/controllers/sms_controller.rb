class SmsController < ApplicationController
  def create
    form = PhoneNumberForm.new(phone_number_form_params)

    if form.valid?
      client.publish({
        phone_number: form.number.phony_normalized(country_code: 'JP'),
        message: ENV["TALK_URL"]
      })
      flash[:notice] = '電話番号宛にメッセージを送信しました'
      redirect_to root_path
    else
      flash.now[:alert] = '電話番号が不正です'
      render 'top/index'
    end
  end

  private

  def client
    @client ||= Aws::SNS::Client.new(
      access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
      secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region: "ap-northeast-1"
    )
  end

  def phone_number_form_params
    params.require(:phone_number_form).permit(:number)
  end
end