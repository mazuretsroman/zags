wife1 = Person.create(
  first_name: 'Wife 1',
  last_name: 'Wife 1',
  gender: 'f',
  day: 0,
  month: 0,
  year: 1980
)
husband1 = Person.create(
  first_name: 'husband 1',
  last_name: 'husband 1',
  gender: 'm',
  day: 0,
  month: 0,
  year: 1980
)
marriage = Marriage.create(
  husband_id: husband1.id,
  wife_id: wife1.id,
  m_day: 0,
  m_month: 0,
  m_year: 1980
)
wife2 = Person.create(
  first_name: 'Wife 2',
  last_name: 'Wife 2',
  gender: 'f',
  day: 0,
  month: 0,
  year: 1980
)
husband2 = Person.create(
  first_name: 'husband 2',
  last_name: 'husband 2',
  gender: 'm',
  day: 0,
  month: 0,
  year: 1980
)
