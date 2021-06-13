class Student
    attr_reader :first_name

    @@all = []


    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end


    def self.all 
        @@all
    end

    def add_boating_test(boating_test_name, boating_test_status, instructor)
        BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
    end

    def self.find_student(name)
        self.all.find{ |student| student.name == name}
    end

    def grade_percentage
        passed_tests = BoatingTest.all.select { |test| test.status == "passed"}

        (passed_tests.length.to_f / BoatingTest.all.length) * 100
    end





end
