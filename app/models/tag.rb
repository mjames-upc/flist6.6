class Tag < ActiveRecord::Base
  def to_param  # overridden
    simple
  end
end
