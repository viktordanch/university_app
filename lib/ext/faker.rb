module Faker

  class Course < Base
    flexible :name

    class << self
      def name
        fetch('course.name')
      end
    end
  end

  class Assignment < Base
    flexible :name

    class << self
      def name
        fetch('assignment.name')
      end
    end
  end

  class University < Base
    flexible :name

    class << self
      def domain
        fetch ('eduemail')
      end
    end
  end
end
