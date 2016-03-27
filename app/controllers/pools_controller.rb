class PoolsController < ApplicationController

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)

    if @pool.save && current_user.update!(pool: @pool)
      flash[:notice] = "Your pool has been created"
      redirect_to @pool
    else
      flash[:error] = "There was a problem creating your pool.  Please try again."
      render :new
    end
  end

  def show
    @pool = Pool.find(params[:id])
  end

  private

  def pool_params
    params.require(:pool).permit(:name)
  end

end
