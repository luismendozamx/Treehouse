class TimeEntry < AccountEntry
  belongs_to :employee
  validates :time, numericality: {greater_than: 0, less_than: 24}

  before_create :calculate_amount!

  def self.per_hour
    34
  end

  def calculate_amount!
    self.amount = TimeEntry.per_hour * self.time
  end
end
