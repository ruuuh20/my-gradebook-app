# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

semester1 = Semester.create(:name => "Fall 2017")
semester2 = Semester.create(:name => "Winter 2017")
semester3 = Semester.create(:name => "Spring 2018")
semester4 = Semester.create(:name => "Summer 2018")


course1 = Course.create(:name => "English A", :code => 123, :semester_id => 1)
course2 = Course.create(:name => "Math A", :code => 456, :semester_id => 1)
course3 = Course.create(:name => "Writing A", :code => 202, :semester_id => 2)
course4 = Course.create(:name => "Math B", :code => 111, :semester_id => 2)
course5 = Course.create(:name => "Testing3", :code => 800, :semester_id => 3)
course5 = Course.create(:name => "Testing4", :code => 934, :semester_id => 4)

admin1 = User.create(:email => "iamadmin@example.com",
            :password => "password",
            :role => :admin)
student1 = User.create(:email => "iamstudent@example.com",
            :password => "password",
            :role => :student,
            :course_ids => [1, 2, 3, 4])
teacher1 = User.create(:email => "iamteacher@example.com",
            :password => "password",
            :role => :teacher,
            :course_ids => [1])
student2 = User.create(:email => "student2@example.com",
            :password => "password",
            :role => :student,
            :course_ids => [2, 4])
student3 = User.create(:email => "student3@example.com",
            :password => "password",
            :role => :student,
            :course_ids => [1])
student4 = User.create(:email => "student4@example.com",
            :password => "password",
            :role => :student,
            :course_ids => [1, 4])

enrollment1 = Registration.create(:user_id => 6, :course_id => 1)
enrollment2 = Registration.create(:user_id => 6, :course_id => 2)
enrollment3 = Registration.create(:user_id => 7, :course_id => 3)
enrollment4 = Registration.create(:user_id => 7, :course_id => 1)

assignment1 = Assignment.create(:name => "essay 1", :description => "this is an essay testing", :date => "2017-12-30", :status => "Completed", :user_id => 3, :course_id => 1)
assignment2 = Assignment.create(:name => "quiz 1", :description => "this is a quiz hihihi", :date => "2017-12-10", :status => "Completed", :user_id => 6, :course_id => 1)
