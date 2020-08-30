class NumerologiesController < ApplicationController
  protect_from_forgery with: :null_session
  def new
    @numerology = Numerology.new
  end

  def create
    puts numologry_params
    user_admin =User.where(email: "tsh@gmail.com").first
    @numerology = user_admin.numerologies.build numologry_params


    if @numerology.save
      flash[:message] = "Bạn đã đăng ký thành công! Hãy chờ đợi email trong vòng 24 tiếng nhá"
    else
      flash[:error] = @numerology.errors.full_messages.to_sentence
    end
    if numologry_params[:from] == "docvi"
      UserMailer.send_docvi(email: @numerology.email,
        name: @numerology.name,
        id: @numerology.id).deliver_later
      @numerology.update!(sent_demo: true)
      redirect_to readmind_path
    else
      UserMailer.send_demo(email: @numerology.email,
        name: @numerology.name,
        id: @numerology.id).deliver_later

      @numerology.update!(sent_demo: true)
      redirect_back fallback_location: root_path
    end
  end

  def numologry_params
    params.require(:numerology).permit(:from, :name, :email, :phone, :day_of_birth, :name2, :day_of_birth2)
  end
end

