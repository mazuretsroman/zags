class Marriage < ApplicationRecord
  belongs_to :husband, class_name: 'Person'
  belongs_to :wife, class_name: 'Person'

  def date
    [m_day, m_month, m_year].join('-')
  end
end
