class Todo < ActiveRecord::Base
  validates :title, presence: true

  before_save :default_values
  def default_values
    self.rating ||= 0
  end

  def self.by_rating
    order 'rating DESC'
  end
end
