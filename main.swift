import Foundation;

struct Question
{
  let question:String ;
  let answer:String;
  let options:Array<String>;

  init(question:String, answer:String, options:Array<String>){
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

  init(){
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
    options = ["366","360","368","365"];
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
    options = ["366","360","368","365"];
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
    options = ["366","360","368","365"];
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
  init(){
    self.amountEarned = 0;
    self.incorrectWinningAmount = 0;
  }

  init(a:Int,b:Int){
    self.amountEarned = a;
    self.incorrectWinningAmount = b;
  }

  func getEarnedAmount() -> Int{
    return self.amountEarned;
  }

  func getIncorrectWinningAmount() -> Int{
    return self.incorrectWinningAmount;
  }

}


class User
{
  var name:String;
  var prize:Prize;
  
  init(name:String){
    self.name = name;
    self.prize = Prize()
  }
}


class GamePrize
{
  let gamePrizes : [Int:Prize]

  init(){
    let customKeys:Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    let customValues:Array<Prize> = 
    [ Prize(a:1000,b:0),
      Prize(a:5000,b:0),
      Prize(a:10000,b:0),
      Prize(a:25000,b:10000),
      Prize(a:50000,b:10000),
      Prize(a:100000,b:10000),
      Prize(a:250000,b:100000),
      Prize(a:500000,b:100000),
      Prize(a:1000000,b:100000)
    ]

    self.gamePrizes = Dictionary(uniqueKeysWithValues: zip(customKeys,customValues))
  }

  func getPrize(qno:Int) -> Prize{
    if let prize:Prize = self.gamePrizes[qno]
    {
      return prize;
    }
    return Prize(a:0,b:0);
  }

}


class Game
{
  var questions:Array<Question>;
  var is50_50Used:Bool = false;
  var isAudienceUsed:Bool = false;
  var user:User;
  let gamePrize:GamePrize;

  func useAudiencePoll(question:Question) -> Int
  {
    //TODO
    self.isAudienceUsed = true;
    return -1;
  }

  func use50_50(question:Question) -> Int
  {
    var incorrectOptions:Array<Int> = [];
    while(true)
    {
      let r = Int.random(in: 0..<4);
      if(question.options[r] == question.answer || incorrectOptions.contains(r))
      {
        continue;
      }
      incorrectOptions.append(r);
      if(incorrectOptions.count == 2)
      {
        break;
      }
    }

    //TODO Print options
    let option1:String = incorrectOptions.contains(0) ? "Options 1 : -- " : "Options 1 : \(question.options[0])"
    let option2:String = incorrectOptions.contains(1) ? "Options 2 : -- " : "Options 2 : \(question.options[1])"
    let option3:String = incorrectOptions.contains(2) ? "Options 3 : -- " : "Options 3 : \(question.options[2])"
    let option4:String = incorrectOptions.contains(3) ? "Options 4 : -- " : "Options 4 : \(question.options[3])"

    let line1:String = option1 + "\t" + option2;
    let line2:String = option3 + "\t" + option4;

    
    while(true)
    {
      print(line1);
      print(line2);

      let option = readLine();
      if let optionInt = Int(option!)
      {
        if(optionInt <= 4 && optionInt >= 1)
        {
          self.is50_50Used = true;
          return optionInt;
        }
      }
      else{
        print("Please enter valid option");
        continue;
      }
    }
    
  }

  init(){
    questions=[]
    self.gamePrize = GamePrize();
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

  func getOptionForTheQuestion(question:Question,qno:Int) -> Int
  {
    while(true)
    {
      print("Question \(qno) :")
      print(question.question);
      print("Please enter h for hint!\n");
      print("Options 1 : \(question.options[0]) \t Options 2 : \(question.options[1]) \n");
      print("Options 3 : \(question.options[2]) \t Options 4 : \(question.options[3]) \n");

      let option = readLine();

      if let optionInt = Int(option!)
      {
        if(optionInt <= 4 && optionInt >= 1)
        {
          return optionInt;
        }
      }
      if let optionH = option
      {
        if(optionH == "h" || optionH == "H")
        {
          let h = useHint(question:question);
          if (h == -1 )
          {
            print("You have used all HINTS");
            continue;
          }
          return h;
        }
      }
      print("Please Enter valid option!");
      continue;
    }
  }

  func getHintMenuOption() -> Int
  {
    while(true)
    {
      print("Please choose One Hint")
      print("1 . 50-50")
      print("2 . Audience")

      let option = readLine();
      if let optionInt = Int(option!)
      {
        if(optionInt <= 2 && optionInt >= 1)
        {
          return optionInt;
        }
      }
      print("Please Enter valid option!");
      continue;
    }
  }

  func useHint(question:Question) -> Int
  {
    if(!self.is50_50Used && !self.isAudienceUsed)
    {
      let hintOption = getHintMenuOption();
      if(hintOption == 1)
      {
        return use50_50(question:question);
      }
      else{
        return useAudiencePoll(question:question);
      }
    }
    else
    {
      if (self.is50_50Used)
      {
        return useAudiencePoll(question:question);
      }
      else if (self.isAudienceUsed)
      {
        return use50_50(question:question);        
      }
      else{
        return -1;
      }
    }
  }

  func start()
  {
    printGreeting();
    getUserDetails()

    var qno = 1;
    while(qno <= 9)
    {
      let currentQuestion = questions[qno-1];
      let option = getOptionForTheQuestion(question:currentQuestion,qno:qno);
      print(option);
      if(currentQuestion.answer == currentQuestion.options[option-1])
      {
        self.user.prize = self.gamePrize.getPrize(qno:qno);
        print("Currect Answer !!!!!!!!!!");
        let totalAmountEarned = self.user.prize.getEarnedAmount();
        print("You have earned Total Amount : \(totalAmountEarned)");
      }
      else{
        print("Wrong Answer !!!!!!!!!!");
        if let corerctOption = currentQuestion.options.firstIndex(of:currentQuestion.answer)
        {
          print("Correct answer : option \(corerctOption+1) : \(currentQuestion.answer)")
        }

        let totalAmountEarned = self.user.prize.getIncorrectWinningAmount();
        print("You have earned Total Amount : \(totalAmountEarned)");
        break;
      }
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