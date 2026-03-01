class Transaction < ApplicationRecord
  belongs_to :user

  enum :status, {
    pending: 0,
    completed: 1,
    rejected: 2
  }
end