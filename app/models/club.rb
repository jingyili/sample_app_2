class Club < ActiveRecord::Base
  attr_accessible :name, :description
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 20}
  validates :description, presence: true, length: {maximum: 140}

  default_scope order: 'clubs.created_at DESC'
end
