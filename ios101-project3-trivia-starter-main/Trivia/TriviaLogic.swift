import Foundation

struct Question {
    let category: String
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
}

class TriviaLogic {
    private(set) var questions: [Question]
    private(set) var currentQuestionIndex: Int
    private(set) var score: Int

    init() {
        self.questions = [
            Question(category: "Science",
                                 question: "What is the chemical symbol for water?",
                                 answers: ["H2O", "CO2", "O2", "NaCl"],
                                 correctAnswerIndex: 0),
                        Question(category: "Geography",
                                 question: "Which country is known as the Land of the Rising Sun?",
                                 answers: ["China", "South Korea", "Japan", "Vietnam"],
                                 correctAnswerIndex: 2),
                        Question(category: "Literature",
                                 question: "Who wrote 'Pride and Prejudice'?",
                                 answers: ["Mark Twain", "Jane Austen", "Charlotte Brontë", "George Orwell"],
                                 correctAnswerIndex: 1)
            //... Add more questions as you see fit.
        ]
        self.currentQuestionIndex = 0
        self.score = 0
    }

    func getCurrentQuestion() -> Question {
        return questions[currentQuestionIndex]
    }

    func answerQuestion(withIndex index: Int) -> Bool {
        let correct = questions[currentQuestionIndex].correctAnswerIndex == index
        if correct {
            score += 1
        }
        return correct
    }

    func nextQuestion() -> Question? {
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {
            return questions[currentQuestionIndex]
        } else {
            return nil
        }
    }

    func resetGame() {
        score = 0
        currentQuestionIndex = 0
    }
}
