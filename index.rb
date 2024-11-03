require 'date'
class Student
    attr_accessor :surname
    attr_accessor :name
    attr_accessor :dateOfBirth


    @students = []
    class << self
        attr_accessor :students   

        def addStudent(student)
            if self.students.any? { |s| s.surname == student.surname && s.name == student.name && s.dateOfBirth == student.dateOfBirth }
                 puts "student already exists"
            else
                self.students<<student
                puts "student added"
            end
        end          
    
        def removeStudent(student)
            if self.students.delete(student)
                puts "student deleted"
            else
                puts "student don't exists"    
            end
        end
        def getStudentsByAge(age)
            self.students.select{|student| student.calculateAge==age}
        end
    
        def getStudentsByName(name)
            self.students.select{|student| student.name==name}
        end   
    end 
    def initialize(name, surname, dateOfBirth)
        @name = name
        @surname = surname
        self.dateOfBirth = dateOfBirth
    end
    def dateOfBirth=(birthday)
        if birthday>Date.today
            raise ArgumentError,"Date of birh must be in the past"
        end
        @dateOfBirth=birthday
    end        

    def calculateAge
        (Date.today-@dateOfBirth).to_i/365
    end 
end

begin
    puts"Hello"
    student1=Student.new("Ivan","Ivanov",Date.new(2005,12,23))
    student2=Student.new("Petri","Petrow",Date.new(2010,3,5))
    student3=Student.new("Petri","Petrow",Date.new(2010,3,5))
    
    Student.addStudent(student1)
    Student.addStudent(student2)
    Student.addStudent(student3)
   
    puts "Students added:"
    puts Student.students.inspect

    puts student1.calculateAge

    puts Student.getStudentsByAge(14).inspect
    puts Student.getStudentsByName("Ivan").inspect

    
    student4 = Student.new("Ivan", "Petrow", Date.new(2026, 5, 5)) 
 
rescue ArgumentError => e
    puts e.message
end    