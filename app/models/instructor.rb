class Instructor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end

    def passed_students
        students_tests = BoatingTest.all.select { |test| test.instructor == self }

        students_tests.select { |test| test.status == "passed"}
    end

    def pass_student(student, test_name)

        test_found = BoatingTest.all.find { |test| test.student.first_name == student.first_name && test.name == test_name}

        if test_found
            test_found.status = "passed"
        else
            BoatingTest.new(student, test_name, "passed", self)
        end
    end

    def fail_student(student, test_name)
        test_found = BoatingTest.all.find { |test| test.student.first_name == student.first_name && test.name == test_name}

        if test_found
            test_found.status = "failed"
        else
            BoatingTest.new(student, test_name, "failed", self)
        end
    end

    def all_students
        students_tests = BoatingTest.all.select { |test| test.instructor == self }

        students_tests.map { |test| test.student}
        
    end
end
