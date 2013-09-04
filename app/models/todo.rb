class Todo < ActiveRecord::Base
  validates :title, presence: true

  def self.by_rating
    order 'rating DESC'
  end

  def rating
    super || 0
  end
end
