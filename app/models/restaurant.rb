class Restaurant < ApplicationRecord
  has_many :reviews,
        -> { extending WithUserAssociationExtension }, dependent: :destroy
  belongs_to :user
  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews do
    def build_with_user(attributes = {}, user)
      attributes[:user] ||= user
      build(attributes)
    end
  end

end
