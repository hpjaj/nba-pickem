class PoolsController < ApplicationController
  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)

    if @pool.save && current_user.update!(pool: @pool)
      flash[:notice] = "Your pool has been created"
      redirect_to root_path
    else
      flash[:error] = "There was a problem creating your pool.  Please try again."
      render :new
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:name)
  end
end
