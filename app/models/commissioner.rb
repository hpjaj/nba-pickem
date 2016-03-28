class Commissioner < ActiveRecord::Base
  belongs_to :user
  has_one :pool
end
