module People
  class CreateService
    attr_reader :person, :params

    def initialize(person, params)
      @params = params
      @person = person
    end

    def call
      create_person
      create_marriage
      person.errors.blank?
    end

    private

    def create_person
      person.update(person_params)
    end

    def marriage
      @marriage ||= begin
        if person.male?
          return Marriage.new(husband_id: person.id,
                              wife_id: params[:wife_id],
                              date: params[:date])
        end

        if person.female?
          return Marriage.new(wife_id: person.id,
                              husband_id: params[:husband_id],
                              date: params[:date])
        end
      end
    end

    def create_marriage
      return if marriage_params_blank?

      if marriage.save
        return true
      else
        person.errors.merge!(marriage.errors)
        return false
      end
    end

    def person_params
      params.slice(:first_name, :last_name, :dob, :gender)
    end

    def marriage_params_blank?
      params[:wife_id].blank? && 
        params[:husband_id].blank? && 
        params[:date].blank?
    end
  end
end

