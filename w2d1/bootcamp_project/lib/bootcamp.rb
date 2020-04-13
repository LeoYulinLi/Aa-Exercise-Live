class Bootcamp

  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @students = []
    @teachers = []
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def student_capacity
    @student_capacity
  end

  def students
    @students
  end

  def teachers
    @teachers
  end

  def hire(teacher_name)
    @teachers << teacher_name
  end

  def enroll(student_name)
    if @student_capacity > @students.length
      @students << student_name
      return true
    end
    false
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      true
    else
      false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)

    return nil if !enrolled?(student) || @grades[student].length == 0

    @grades[student].sum / num_grades(student)

  end

end
