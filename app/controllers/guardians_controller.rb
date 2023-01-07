class GuardiansController < ApplicationController
  before_action :load_guardian

  def destroy
    @guardian = Guardian.find(params[:id])
    @guardian.destroy
    head :no_content
  end

  private

  def load_guardian
    @guardian = Guardian.includes(:children).find(params[:id])
  end
end
