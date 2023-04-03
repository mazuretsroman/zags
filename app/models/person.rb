class Person < ApplicationRecord
  GENDERS = ['m', 'f'].freeze

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }

  enum gender: {m: 'Male', f: 'Female'}

  scope :search, lambda { |query|
    where(
      'LOWER(first_name) LIKE LOWER(?) OR LOWER(last_name) LIKE LOWER(?)',
      "%#{query}%",
      "%#{query}%"
    )
  }

  def full_name
    [first_name, last_name].join(' ')
  end

  def wife
    Marriage.find_by(husband_id: id)&.wife
  end

  def husband
    Marriage.find_by(wife_id: id)&.husband
  end

  def male?
    gender == 'm'
  end

  def female?
    gender == 'f'
  end

  def partner
    return husband if female?
    
    wife if male?
  end

  def marriage
    if male?
      return Marriage.find_by(husband_id: id)
    end

    if female?
      return Marriage.find_by(wife_id: id)
    end
  end

  def dob
    [day, month, year].join('-')
  end
end
