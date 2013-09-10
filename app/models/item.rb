class Item
  include Mongoid::Document

  field :name, type: String
  field :content, type: String
  field :priority, type: Integer

  validates_numericality_of :priority, 
  		greater_than_or_equal_to: 1,
  		less_than_or_equal_to: 5,
  		only_integer: true

  belongs_to :user, dependent: :delete
  has_and_belongs_to_many :tags

end
