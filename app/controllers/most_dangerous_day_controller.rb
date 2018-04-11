class MostDangerousDayController < ApplicationController
  def index
    @info = MostDangerousDayPresenter.new(params[:start_date], params[:end_date])
  end
end
