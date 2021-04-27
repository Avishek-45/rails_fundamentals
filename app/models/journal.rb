class Journal < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :cash_inOut, presence: true
  validates :amount, presence: true, numericality: true

  def self.total_expense
    Journal.where(cash_inOut: "false").sum(:amount)
  end

  def self.total_income
    Journal.where(cash_inOut:"true").sum(:amount)
  end

  def self.user_total_income(user_id)
    Journal.where(user_id:user_id , cash_inOut:"true").sum(:amount)
  end

  def self.user_total_expense(user_id)
    Journal.where(user_id:user_id , cash_inOut:"false").sum(:amount)
  end
end
