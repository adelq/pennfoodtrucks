class Suggestion < ActiveRecord::Base
  enum status: {
    accepted: 0,
    rejected: 1,
    waiting: 2
  }
end
