class Event < ActiveRecord::Base
  validates_presence_of :title,:venue,:date,:time
  has_many :users
end
