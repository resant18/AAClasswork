class User < ApplicationRecord

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course

    # has_many :enrolled_courses,
    # primary_key: :id,
    # foreign_key: :course_id,
    # class_name: :Enrollment

end
