class Person < ApplicationRecord
  GENDERS = ['m', 'f'].freeze

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }

  enum gender: {m: 'Male', f: 'Female'}

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

  def marriage
    if male?
      return Marriage.find_by(husband_id: id)
    end

    if female?
      return Marriage.find_by(wife_id: id)
    end
  end
end