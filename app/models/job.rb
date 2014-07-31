class Job < ActiveRecord::Base
  
  # relationships
  has_many :skills, dependent: :destroy

  # cleansing
  before_validation :strip_leading_and_trailing_whitespace

  # validation
  validates :company,
    length: { in: 2..100 },
    uniqueness: { scope: [:title, :start_date], case_sensitive: false, message: "- this job already exists (same company, title, and start date)" }

  validates :title,
    length: { in: 2..100 }

  validates :start_date,
    presence: true

  validates :end_date,
    presence: true
    
  validate :start_date_must_be_before_end_date

  protected

  def strip_leading_and_trailing_whitespace
    self.company = self.company.sub(/\A\s+/, '').sub(/\s+\z/, '') if attribute_present?(:company)
    self.title = self.title.sub(/\A\s+/, '').sub(/\s+\z/, '') if attribute_present?(:title)
  end
  
  def start_date_must_be_before_end_date
    return unless attribute_present?(:start_date) and attribute_present?(:end_date)
    self.errors.add(:base, "end date cannot be before start date") if self.end_date < self.start_date
  end

end
