class User < ActiveRecord::Base
  validates_presence_of :name,:email,:mobile
  validates_uniqueness_of :email, :scope => :event_id
  validates_numericality_of :mobile
  validates_length_of :mobile, :in => 10..10, :allow_blank => false , :message => " number invalid. Must be 10 digit."
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@intelegencia\.com)$/i ,:message => "is invalid , Only intelegencia provided emails are allowed."

  belongs_to :event
end
