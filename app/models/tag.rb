class Tag
  include Mongoid::Document

  field :name

  belongs_to :user, dependent: :delete
  has_and_belongs_to_many :items, index: true

end
