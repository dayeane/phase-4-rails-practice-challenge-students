class InstructorsController < ApplicationController
  def index
    instructors = Instructor.all
     render json:instructors, status: :ok
   end
 
   def update
     instructor = Instructor.find_by(id: params[:id])
     if instructor
       render json: instructor, status: :updated
     else
       render json: "Instructor not found"
     end
   end
 
   def create
     instructor = Instructor.create(instructor_params)
     render json: instructor, status: :created
   end
 
   def destroy
     instructor = Instructor.find_by(id: params[:id])
     if instructor
       instructor.destroy
       render json: instructor, status: :destroyed
     else
       render json: "Instructor not found"
     end
   end
 
   private 
 
   def instructor_params
     params.permit(:name,:major, :age)
   end
 
end
