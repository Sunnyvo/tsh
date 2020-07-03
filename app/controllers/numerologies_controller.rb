class NumerologiesController < ApplicationController
  def new
    @numerology = Numerology.new
  end

  def create
    user_admin =User.where(email: "tsh@gmail.com").first
    @numerology = user_admin.numerologies.build numologry_params
    if @numerology.save
      flash[:message] = "bạn đã đăng ký thành công! Hãy chờ đời email trong vòng 24 tiếng nhá"
    else
      flash[:error] = @numerology.errors.full_messages.to_sentence
    end

    redirect_back fallback_location: root_path
  end

  def numologry_params
    params.require(:numerology).permit(:name, :email, :phone, :day_of_birth)
  end
end
