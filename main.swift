import Foundation;

struct Question
{
  let question:String ;
  let answer:String;
  let options:Set<String>;

  init(question:String, answer:String, options:Set<String>) 
  {
    self.question = question;
    self.answer = answer;
    self.options = options;
  }

}

class QuestionBank
{
  var easyQuestions:Array<Question>=[];
  var mediumQuestions:Array<Question>=[];
  var hardQuestions:Array<Question>=[];

  init()
  {
    initializeEasyQuestions();
    initializeMediumQuestions();
    initializeHardQuestions();
  }

  func getEasyQuestions() -> Array<Question>
  {
    return easyQuestions;
  }

  func getMediumQuestions() -> Array<Question>
  {
    return mediumQuestions;
  }

  func getHardQuestions() -> Array<Question>
  {
    return hardQuestions;
  }

  func initializeEasyQuestions()
  {
    var question = "How many days do we have in a week?";
    var answer = "7";
    var options:Set<String> = ["5","7","8","3"];
    let q1 = Question(question:question,answer:answer,options:options);
    easyQuestions.append(q1);

    question = "How many days are there in a year?";
    answer = "365";
    options = ["366","360","368","300"];
    let q2 = Question(question:question,answer:answer,options:options);
    easyQuestions.append(q2);

    question = "How many colors are there in a rainbow?";
    answer = "7";
    options = ["5","3","8","7"];
    let q3 = Question(question:question,answer:answer,options:options);
    easyQuestions.append(q3);

    question = "How many letters are there in the English alphabet?";
    answer = "26";
    options = ["28","25","26","22"];
    let q4 = Question(question:question,answer:answer,options:options);
    easyQuestions.append(q4);

    question = "Which month of the year has the least number of days?";
    answer = "february";
    options = ["january","december","february","march"];
    let q5 = Question(question:question,answer:answer,options:options);
    easyQuestions.append(q5);

    
  }

  func initializeMediumQuestions()
  {
    var question = "How many days do we have in a week?";
    var answer = "7";
    var options:Set<String> = ["5","7","8","3"];
    let q1 = Question(question:question,answer:answer,options:options);
    mediumQuestions.append(q1);

    question = "How many days are there in a year?";
    answer = "365";
    options = ["366","360","368","300"];
    let q2 = Question(question:question,answer:answer,options:options);
    mediumQuestions.append(q2);

    question = "How many colors are there in a rainbow?";
    answer = "7";
    options = ["5","3","8","7"];
    let q3 = Question(question:question,answer:answer,options:options);
    mediumQuestions.append(q3);

    question = "How many letters are there in the English alphabet?";
    answer = "26";
    options = ["28","25","26","22"];
    let q4 = Question(question:question,answer:answer,options:options);
    mediumQuestions.append(q4);

    question = "Which month of the year has the least number of days?";
    answer = "february";
    options = ["january","december","february","march"];
    let q5 = Question(question:question,answer:answer,options:options);
    mediumQuestions.append(q5);

  }

  func initializeHardQuestions()
  {
    var question = "How many days do we have in a week?";
    var answer = "7";
    var options:Set<String> = ["5","7","8","3"];
    let q1 = Question(question:question,answer:answer,options:options);
    hardQuestions.append(q1);

    question = "How many days are there in a year?";
    answer = "365";
    options = ["366","360","368","300"];
    let q2 = Question(question:question,answer:answer,options:options);
    hardQuestions.append(q2);

    question = "How many colors are there in a rainbow?";
    answer = "7";
    options = ["5","3","8","7"];
    let q3 = Question(question:question,answer:answer,options:options);
    hardQuestions.append(q3);

    question = "How many letters are there in the English alphabet?";
    answer = "26";
    options = ["28","25","26","22"];
    let q4 = Question(question:question,answer:answer,options:options);
    hardQuestions.append(q4);

    question = "Which month of the year has the least number of days?";
    answer = "february";
    options = ["january","december","february","march"];
    let q5 = Question(question:question,answer:answer,options:options);
    hardQuestions.append(q5);

  }


};

class Game
{
  func start()
  {
      let qBank = QuestionBank()
      let easyQuestions = qBank.getEasyQuestions()

      for question in easyQuestions
      {
        print(question.question)
      }
  }

};



func main()
{

  let myGame = Game();
  myGame.start();

}

main()