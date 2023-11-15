class Users
    require_relative 'questions_database'
    require_relative 'question'
    require_relative 'reply' 
    require_relative 'question_follows'

    def self.find_by_id(id)
        users = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM 
                users
            WHERE 
                id = ?
        SQL
        users.map{|user| User.new(user)}
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM 
                users
            WHERE 
                fname = ? AND lname = ?
        SQL
        User.new(user.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end
