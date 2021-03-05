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

  }

  func initializeMediumQuestions()
  {
    
  }

  func initializeHardQuestions()
  {
    
  }


};

class Game
{
  func start()
  {

  }

};



func main()
{

  let myGame = Game();
  myGame.start();

}

main()