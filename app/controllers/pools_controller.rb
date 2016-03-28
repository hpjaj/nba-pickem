class PoolsController < ApplicationController

  def new
    @pool = Pool.new
  end

  def create
    if pool_creation_transaction
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

  def pool_creation_transaction
    ActiveRecord::Base.transaction do
      begin
        @pool = current_user.pools.create!(pool_params)
        commissioner = current_user.commissioners.create!
        @pool.update!(commissioner: commissioner)
      rescue Exception => e
        logger.error "User #{current_user.id} experience #{e.message} when trying to create a new pool"
        false
      end
    end
  end

end
