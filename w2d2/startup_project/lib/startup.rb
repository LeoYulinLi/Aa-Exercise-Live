require "employee"

class Startup

  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    salaries.has_key?(title)
  end

  def >(other)
    self.funding > other.funding
  end

  def hire(name, title)
    if valid_title?(title)
      employees << Employee.new(name, title)
    else
      raise ArgumentError.new("Invalid Title")
    end
  end

  def size
    employees.length
  end

  def pay_employee(employee)
    salary = salaries[employee.title]
    if salary < funding
      employee.pay(salary)
      @funding -= salary
    else
      raise Exception("Not enough funding")
    end
  end

  def payday
    employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    employees.map { |employee| salaries[employee.title] }.sum / employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other)
    @funding += other.funding
    other.salaries.each do |title, salary|
      @salaries[title] = salary if !@salaries.has_key?(title)
    end
    @employees += other.employees
    other.close
  end

end
