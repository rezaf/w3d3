class Course < ActiveRecord::Base
  has_many(
    :enrollments,
    :class_name => "Enrollment",
    :foreign_key => :course_id,
    :primary_key => :id 
  )
  
  has_many(
    :enrolled_students, 
    :through => :enrollments, 
    :source  => :user
  )
          
  belongs_to(
    :prerequisite,
    :class_name => "Course",
    :foreign_key => :prereq_id,
    :primary_key => :id
  )
  
  belongs_to(
    :instructor,
    :class_name => "User",
    :foreign_key => :instructor_id,
    :primary_key => :id
  )
  
  # def prerequisites
  #   #@options
  #   DB.execute("SELECT * FROM courses where id = ?", self.prereq_id)
  #   #return the instance of the class that we belong to
  # end
    
  # def enrollments
  #   DB.execute("SELECT * enrollments where course_id = ?", self.id)
  #   #return an array(collection_proxy) of all the records that this thing 'has'
  # end
  
  # def enrollments
  #   DB.execute("SELECT * from enrollments id = ", self.course_id)
  # end
end
