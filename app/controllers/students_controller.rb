class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students, status: :ok
  end

  def update
    student = Student.find_by(id: params[:id])
    if student
      render json: student, status: :updated
    else
      render json: "Student not found"
    end
  end

  def create
    student = Student.create(students_params)
    render json: student, status: :created
  end

  def destroy
    student = Student.find_by(id: params[:id])
    if student
      student.destroy
      render json: student, status: :destroyed
    else
      render json: "Student not found"
    end
  end

  private 

  def students_params
    params.permit(:name,:major, :age)
  end
end

