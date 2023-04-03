class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people =
      if params[:query]
        Person.where('first_name ilike ?% or last_name ilike ?%', params[:query], params[:query])
      else
        Person.all.page(params[:page])
      end
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new
    respond_to do |format|
      if People::CreateService.new(@person, person_params).call
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if People::UpdateService.new(@person, person_params).call
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy
    Marriage.where(husband_id: @person.id).map(&:destroy)
    Marriage.where(wife_id: @person.id).map(&:destroy)

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params
        .require(:person)
        .permit(:first_name, :last_name, :day, :month, :year, :gender,
                :wife_id, :husband_id, :m_day, :m_month, :m_year)
    end

    def marriage_params
      person_params.slice(:wife_id, :husband_id, :m_day, :m_month, :m_year)
    end

    def current_person_params
      person_params.slice(:first_name, :last_name, :day, :month, :year, :gender)
    end
end
