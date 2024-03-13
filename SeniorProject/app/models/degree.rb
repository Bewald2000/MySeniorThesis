class Degree < ApplicationRecord
  include Visible

  belongs_to :users
  has_many :majors
  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
