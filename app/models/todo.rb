class Todo < ActiveRecord::Base
  def self.by_rating
    order 'rating DESC'
  end

  def rating
    super || 0
  end
end
