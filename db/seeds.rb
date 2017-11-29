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
# course5 = Course.create(:name => "blah", :code => 001, :semester_id => 3)

# admin1 = User.create(:email => "iamadmin@example.com",
#             :password => "password",
#             :role => :admin)
student1 = User.create(:email => "iamstudent@example.com",
            :password => "password",
            :role => :student,
            :course_ids => [3, 4])
teacher1 = User.create(:email => "iamteacher@example.com",
            :password => "password",
            :role => :teacher)
guardian1 = User.create(:email => "iamguardian@example.com",
            :password => "password",
            :role => :guardian)


# enrollment1 = Registration.create(:user_id => 6, :course_id => 1)
# enrollment2 = Registration.create(:user_id => 6, :course_id => 2)
# enrollment3 = Registration.create(:user_id => 7, :course_id => 3)
# enrollment4 = Registration.create(:user_id => 7, :course_id => 1)
