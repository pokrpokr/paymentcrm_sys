class Basic < ActiveRecord::Base
  belongs_to :finance, polymorphic: true
end
