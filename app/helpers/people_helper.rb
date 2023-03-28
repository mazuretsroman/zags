module PeopleHelper
  def select_people_for_marriage(person)
    Person.where.not(id: person.id)
  end
end
