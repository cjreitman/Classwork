class Employee
    attr_reader :bonus, :salary, 

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        
    end

    def generate_bonus(multiplier)
        @bonus = salary * multiplier
    end

    def total_salary
        debugger
        @bonus + salary
    end

    def boss=(employee)

        if employee.is_a?(Manager) && !employee.underlings.include?(self)
            employee.underlings << self
        end
    end
end

class Manager < Employee
    attr_reader :underlings

    def initialize(name, title, salary, boss)
        super
        @underlings = []
    end

    def generate_bonus(multiplier)
        @bonus = 0
        queue = @underlings
        
        while !queue.empty?

            underling = queue.shift
            @bonus += underling.total_salary
            if underling.is_a?(Manager)
                queue.concat(underling.underlings)
            end
            
        end
        return @bonus * multiplier
    end 

    

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
jake = Employee.new("Ned", "Employee", 120000, darren)
sam = Employee.new("Sam", "Employee", 110000, darren)

darren.boss = ned
sam.boss = darren
p ned.underlings
p darren.underlings
p darren.generate_bonus(5)
