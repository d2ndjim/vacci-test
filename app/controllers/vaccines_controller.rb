class VaccinesController < ApplicationController
  def index
    @ward = Ward.find(params[:ward_id])
    case params[:filter]
    when 'due'
      @vaccines = @ward.vaccines.due
    when 'upcoming'
      @vaccines = @ward.vaccines.upcoming
    when 'completed'
      @vaccines = @ward.vaccines.completed
    when 'all'
      @vaccines = @ward.vaccines.all
    end
    render json: @vaccines, status: :ok
  end
end