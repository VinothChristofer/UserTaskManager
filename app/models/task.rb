class Task < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 4 }
    # add due date presance once conversion of date to utc as per location of user, to epoc is done
end
  