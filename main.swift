import Foundation;

struct Question
{
  let question:String ;
  let answer:String;
  let options:Array<String>;

  init(question:String, answer:String, options:Array<String>) 
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

  func getQuestions(difficulty:String) -> Array<Question>
  {
    var temp:Array<Question>=[]
    var selectedIndexes:Array<Int>=[]
    for _ in 1...3
    {

      var randomInt:Int = 0;
      while(true)
      {
        randomInt = Int.random(in: 0..<5)
        if(selectedIndexes.contains(randomInt))
        {
          continue;
        }
        else{
          selectedIndexes.append(randomInt)
          break;
        }
      }
      
      if(difficulty == "easy")
      {
        temp.append(easyQuestions[randomInt])
      }
      else if(difficulty == "medium")
      {
        temp.append(mediumQuestions[randomInt])
      }
      else{
        temp.append(hardQuestions[randomInt])
      }
        
    }
    return temp;
  }

  func initializeEasyQuestions()
  {
    var question = "How many days do we have in a week?";
    var answer = "7";
    var options:Array<String> = ["5","7","8","3"];
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
    var options:Array<String> = ["5","7","8","3"];
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
    var options:Array<String> = ["5","7","8","3"];
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

struct Prize{
  var amountEarned:Int;
  var incorrectWinningAmount:Int;
  init()
  {
    self.amountEarned = 0;
    self.incorrectWinningAmount = 0;
  }

  init(a:Int,b:Int)
  {
    self.amountEarned = a;
    self.incorrectWinningAmount = b;
  }

}


class User
{
  var name:String;
  var prize:Prize;
  
  init(name:String)
  {
    self.name = name;
    self.prize = Prize()
  }
}


class GamePrize
{
  let customKeys:Array<Int>;
  let customValues:Array<Prize>;
  let gamePrizes : [Int:Prize]

  init()
  {
    self.customKeys = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    self.customValues = 
    [ Prize(a:0,b:0),
      Prize(a:0,b:0),
      Prize(a:10000,b:0),
      Prize(a:0,b:10000),
      Prize(a:0,b:10000),
      Prize(a:100000,b:10000),
      Prize(a:250000,b:100000),
      Prize(a:500000,b:100000),
      Prize(a:1000000,b:100000)
    ]

    self.gamePrizes = Dictionary(uniqueKeysWithValues: zip(self.customKeys,self.customValues))
  }

}


class Game
{
  var questions:Array<Question>;
  var is50_50Used:Bool = false;
  var isAudienceUsed:Bool = false;
  var user:User;

  init()
  {
    questions=[]
    var temp:Array<Question> = [];
    let qBank = QuestionBank();
    var q = qBank.getQuestions(difficulty:"easy");
    temp.append(contentsOf:q);
    q = qBank.getQuestions(difficulty:"medium");
    temp.append(contentsOf:q);
    q = qBank.getQuestions(difficulty:"hard");
    temp.append(contentsOf:q);
    questions.append(contentsOf:temp)

    self.user = User(name:"User");

  }

  func getUserDetails()
  {
    print("Enter your name : ")
    let optionalName = readLine();
    var name = "User"
    if let name_ = optionalName {
      name = "\(name_)"
    }
    self.user = User(name:name);
    print("Hello, \(user.name)")
  }

  func printGreeting()
  {
    print("Welcome to Who Wants To Be A Millionaire?");
  }



  func start()
  {
    printGreeting();
    getUserDetails()

    var qno = 1;
    while(qno <= 9)
    {
      let currentQuestion = questions[qno-1];
      print("Question \(qno) :")
      print(currentQuestion.question);
      print("\n");
      print("Options 1 : \(currentQuestion.options[0]) \t Options 2 : \(currentQuestion.options[1]) \n");
      print("Options 3 : \(currentQuestion.options[2]) \t Options 4 : \(currentQuestion.options[3]) \n");

      

      qno += 1;
    }
  }

};



func main()
{

  let myGame = Game();
  myGame.start();

}

main()