# This will be run during `rake db:seed` in the :production environment.

include Sprig::Helpers

sprig [Tag, FrankenBrewery, FrankenBeer]
ActiveRecord::Base.record_timestamps = false
begin
  sprig [FrankenRating]
ensure
  ActiveRecord::Base.record_timestamps = true  # don't forget to enable it again!
end
