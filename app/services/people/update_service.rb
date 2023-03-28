module People
  class UpdateService
    attr_reader :person, :params

    def initialize(person, params)
      @params = params
      @person = person
    end

    def call
      update_person
      update_marriage
      person.errors.blank?
    end

    private

    def update_person
      person.update(person_params)
    end

    def marriage
      person.marriage.presence || Marriage.new
    end

    def update_marriage
      if marriage.update(marriage_params)
        return true
      else
        person.errors.merge!(marriage.errors)
        return false
      end
    end

    def person_params
      params.slice(:first_name, :last_name, :dob, :gender)
    end

    def marriage_params
      m_params = params.slice(:husband_id, :wife_id, :date)
      m_params[:husband_id] = person.id if person.male?
      m_params[:wife_id] = person.id if person.female?
      m_params
    end
  end
end
