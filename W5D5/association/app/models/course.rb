class Course < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User
  
  has_many :prerequisite, ## interchangeable with BELONGS_TO when referring to class
    primary_key: :id, 
    foreign_key: :prereq_id,
    class_name: :Course

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: User

  # belongs_to :instructor,
  #   through: :user,
  #   source: :course

end

