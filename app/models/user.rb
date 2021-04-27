class User < ApplicationRecord
    has_many :journals, dependent: :destroy

    # validates :first_name, presence: true
    # validates :last_name, presence: true
    # validates :email, presence: true
    # validates :phone, presence: true

    validates_presence_of :first_name, :last_name, :email, :phone

    def full_name
        first_name + ' ' + last_name
    end
end
