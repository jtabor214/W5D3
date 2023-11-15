class Question

    require 'questions_database'

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM 
                questions
            WHERE 
                id = ?
        SQL
        question.map{|question| Question.new(question)}
    end

    def self.find_by_author_id(author_id)
        question_asker = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM 
                questions
            WHERE 
                author_id = ?
        SQL
        question_asker.map{|question| Question.new(question)}
    end

end