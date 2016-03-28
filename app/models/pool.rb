class Pool < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :commissioner
  has_many :picks
end
