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

enum Option
{
  case WALK_AWAY
  case ONE
  case TWO
  case THREE
  case FOUR
  case NONE
}

enum Difficulty {
  case easy
  case medium
  case hard
}

class QuestionBank
{
  var easyQuestions:Array<Question>=[];
  var mediumQuestions:Array<Question>=[];
  var hardQuestions:Array<Question>=[];

  func initializeQuestions(){}

  func getQuestions(difficulty:Difficulty) -> Array<Question>
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
      
      if(difficulty == Difficulty.easy)
      {
        temp.append(easyQuestions[randomInt])
      }
      else if(difficulty == Difficulty.medium)
      {
        temp.append(mediumQuestions[randomInt])
      }
      else{
        temp.append(hardQuestions[randomInt])
      }
        
    }
    return temp;
  }

}

class EasyQuestionBank : QuestionBank
{
  override func initializeQuestions()
  {
    var question = "How many days do we have in a week?";
    var answer = "7";
    var options:Array<String> = ["5","7","8","3"];
    let q1 = Question(question:question,answer:answer,options:options);
    super.easyQuestions.append(q1);

    question = "How many days are there in a year?";
    answer = "365";
    options = ["366","360","368","365"];
    let q2 = Question(question:question,answer:answer,options:options);
    super.easyQuestions.append(q2);

    question = "How many colors are there in a rainbow?";
    answer = "7";
    options = ["5","3","8","7"];
    let q3 = Question(question:question,answer:answer,options:options);
    super.easyQuestions.append(q3);

    question = "How many letters are there in the English alphabet?";
    answer = "26";
    options = ["28","25","26","22"];
    let q4 = Question(question:question,answer:answer,options:options);
    super.easyQuestions.append(q4);

    question = "Which month of the year has the least number of days?";
    answer = "february";
    options = ["january","december","february","march"];
    let q5 = Question(question:question,answer:answer,options:options);
    super.easyQuestions.append(q5);    
  }

  func getQuestions() -> Array<Question>
  {
    return super.getQuestions(difficulty:Difficulty.easy);
  }  

}

class MediumQuestionBank : QuestionBank
{
  
  override func initializeQuestions()
  {
    var question = "How many days do we have in a week?";
    var answer = "7";
    var options:Array<String> = ["5","7","8","3"];
    let q1 = Question(question:question,answer:answer,options:options);
    super.mediumQuestions.append(q1);

    question = "How many days are there in a year?";
    answer = "365";
    options = ["366","360","368","365"];
    let q2 = Question(question:question,answer:answer,options:options);
    super.mediumQuestions.append(q2);

    question = "How many colors are there in a rainbow?";
    answer = "7";
    options = ["5","3","8","7"];
    let q3 = Question(question:question,answer:answer,options:options);
    super.mediumQuestions.append(q3);

    question = "How many letters are there in the English alphabet?";
    answer = "26";
    options = ["28","25","26","22"];
    let q4 = Question(question:question,answer:answer,options:options);
    super.mediumQuestions.append(q4);

    question = "Which month of the year has the least number of days?";
    answer = "february";
    options = ["january","december","february","march"];
    let q5 = Question(question:question,answer:answer,options:options);
    super.mediumQuestions.append(q5);    
  }

  func getQuestions() -> Array<Question>
  {
    return super.getQuestions(difficulty:Difficulty.medium);
  }  

}

class HardQuestionBank : QuestionBank
{
  override func initializeQuestions()
  {
    var question = "How many days do we have in a week?";
    var answer = "7";
    var options:Array<String> = ["5","7","8","3"];
    let q1 = Question(question:question,answer:answer,options:options);
    super.hardQuestions.append(q1);

    question = "How many days are there in a year?";
    answer = "365";
    options = ["366","360","368","365"];
    let q2 = Question(question:question,answer:answer,options:options);
    super.hardQuestions.append(q2);

    question = "How many colors are there in a rainbow?";
    answer = "7";
    options = ["5","3","8","7"];
    let q3 = Question(question:question,answer:answer,options:options);
    super.hardQuestions.append(q3);

    question = "How many letters are there in the English alphabet?";
    answer = "26";
    options = ["28","25","26","22"];
    let q4 = Question(question:question,answer:answer,options:options);
    super.hardQuestions.append(q4);

    question = "Which month of the year has the least number of days?";
    answer = "february";
    options = ["january","december","february","march"];
    let q5 = Question(question:question,answer:answer,options:options);
    super.hardQuestions.append(q5);   
  }

  func getQuestions() -> Array<Question>
  {
    return super.getQuestions(difficulty:Difficulty.hard);
  }

}

struct Prize{
  var amountEarned:Int;
  var incorrectWinningAmount:Int;
  var walkAwayAmount:Int;
  init(){
    self.amountEarned = 0;
    self.incorrectWinningAmount = 0;
    self.walkAwayAmount = 0;
  }

  init(a:Int,b:Int,c:Int){
    self.amountEarned = a;
    self.incorrectWinningAmount = b;
    self.walkAwayAmount = c;
  }

  func getEarnedAmount() -> Int{
    return self.amountEarned;
  }

  func getIncorrectWinningAmount() -> Int{
    return self.incorrectWinningAmount;
  }

  func getWalkAwayAmount() -> Int{
    return self.walkAwayAmount;
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
    [ Prize(a:1000,b:0,c:0),
      Prize(a:5000,b:0,c:0),
      Prize(a:10000,b:0,c:10000),

      Prize(a:25000,b:10000,c:10000),
      Prize(a:50000,b:10000,c:10000),
      Prize(a:100000,b:10000,c:100000),

      Prize(a:250000,b:100000,c:250000),
      Prize(a:500000,b:100000,c:500000),
      Prize(a:1000000,b:100000,c:1000000)
    ]

    self.gamePrizes = Dictionary(uniqueKeysWithValues: zip(customKeys,customValues))
  }

  func getPrize(qno:Int) -> Prize{
    if let prize:Prize = self.gamePrizes[qno]
    {
      return prize;
    }
    return Prize(a:0,b:0,c:0);
  }

}

class Game
{
  var questions:Array<Question>;
  var is50_50Used:Bool = false;
  var isAudienceUsed:Bool = false;
  var user:User;
  let gamePrize:GamePrize;

  func getQuestionOption(option:Option) -> Int
  {
    switch option 
    {
      case .ONE:
        return 1;
      case .TWO:
        return 2;
      case .THREE:
        return 3;
      case .FOUR:
        return 4;
      default :
        return -1;
    }
  }

  func getQuestionOption(option:Int) -> Option
  {
    switch option 
    {
      case 1:
        return Option.ONE
      case 2:
        return Option.TWO
      case 3:
        return Option.THREE
      case 4:
        return Option.FOUR
      default:
        return Option.NONE
    }

  }


  func getAudiencePolling(question:Question) -> Dictionary<Int,Int>
  {
    var answerPolling:[Int : Int]=[:];
    if let correctOption = question.options.firstIndex(of:question.answer)
    {
      answerPolling[correctOption+1] = 75;

      var remainingPercent = 25;

      for i in 1...4
      {
        if(correctOption+1 == i)
        {
          continue;
        }
        if(answerPolling.count == 3)
        {
          answerPolling[i] = remainingPercent;
          break;
        }
        let percent = Int.random(in:8...12);
        answerPolling[i] = percent;
        remainingPercent = remainingPercent - percent;        
      }
      return answerPolling;
    }
    print("No answer found!");
    return [:];
  }

  func useAudiencePoll(question:Question) -> Option
  {
    //TODO
    let pollStatus = getAudiencePolling(question:question);
    while(true)
    {
      print("Audience Poll Status :")
      for i in 1...4
      {
        if let percent = pollStatus[i] {
          print("Option \(i) : \(percent)%");
        }
      }

      let option = readLine();
      if let optionInt = Int(option!)
      {
        if(optionInt <= 4 && optionInt >= 1)
        {
          self.isAudienceUsed = true;
          return getQuestionOption(option:optionInt);
        }
      }
      else{
        print("Please enter valid option");
        continue;
      }
    }
  }

  func use50_50(question:Question) -> Option
  {
    var incorrectOptions:Array<Int> = [];
    while(true)
    {
      let r = Int.random(in: 0..<4);//0,1,2,3
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
          return getQuestionOption(option:optionInt);
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
    
    let easyQBank = EasyQuestionBank();
    easyQBank.initializeQuestions();
    let q1 = easyQBank.getQuestions();
    temp.append(contentsOf:q1);

    let mediumQBank = MediumQuestionBank();
    mediumQBank.initializeQuestions();
    let q2 = mediumQBank.getQuestions();
    temp.append(contentsOf:q2);

    let hardQBank = HardQuestionBank();
    hardQBank.initializeQuestions();
    let q3 = hardQBank.getQuestions();
    temp.append(contentsOf:q3);

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

  func getOptionForTheQuestion(question:Question,qno:Int) -> Option
  {
    var isSureUsed:Bool = false;
    while(true)
    {
      print("Game Round : \(getRound(qno:qno))");
      print("Question : \(qno)/9");
      print(question.question);
      if(qno >= 1 && qno < 7)
      {
        print("Please enter h for hint!\n");
      }
      print("Options 1 : \(question.options[0]) \t Options 2 : \(question.options[1]) \n");
      print("Options 3 : \(question.options[2]) \t Options 4 : \(question.options[3]) \n");

      if(qno == 4 || qno > 6)
      {
        print("Do you want to walk away? (y/n)");
        print("You will win $\(self.user.prize.getWalkAwayAmount())")
        let option = readLine();

        if let optionStr = option
        {
          print("Walk away \(optionStr)");
          if(optionStr == "y" || optionStr == "Y"){
            return Option.WALK_AWAY;
          }
          print("Choose Options :");
        }

      }
      let option = readLine();

      if let optionInt = Int(option!)
      {
        if(optionInt <= 4 && optionInt >= 1)
        { 
          if(isSureUsed)
          {
            return getQuestionOption(option:optionInt);
          }
          print("You have selected \(optionInt) Are you sure? (y/n)");
          let optionSure = readLine();
          if let optionS = optionSure
          {
            if(optionS == "y" || optionS == "Y")
            {
              return getQuestionOption(option:optionInt);
            }
            else
            {
              isSureUsed = true;
              continue;
            }
          }
        }
      }
      if(qno >= 1 && qno < 7)
      {
        if let optionH = option
        {
          if(optionH == "h" || optionH == "H")
          {
            let h = useHint(question:question);
            if (h == Option.NONE )
            {
              print("You have used all HINTS");
              continue;
            }
            return h;
          }
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

  func useHint(question:Question) -> Option
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
      if (!self.is50_50Used)
      {
        return use50_50(question:question);
      }
      else if (!self.isAudienceUsed)
      {
        return useAudiencePoll(question:question);
      }
      else{
        return Option.NONE;
      }
    }
  }

  func getRound(qno:Int) -> Int
  {
    if( qno >= 1 && qno <= 3)
    {
      return 1;
    }
    else if( qno >= 4 && qno <= 6)
    {
      return 2;
    }
    else
    {
      return 3;
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
      if(option == Option.WALK_AWAY)
      {
        let totalAmountEarned = self.user.prize.getWalkAwayAmount();
        print("You have walk away from the Game!")
        print("You have earned Total Amount : $\(totalAmountEarned)");
        break;
      }
      if(currentQuestion.answer == currentQuestion.options[getQuestionOption(option:option)-1])
      {
        self.user.prize = self.gamePrize.getPrize(qno:qno);
        print("Correct Answer !!!!!!!!!!");
        let totalAmountEarned = self.user.prize.getEarnedAmount();
        print("You have earned Total Amount : $\(totalAmountEarned)");        
      }
      else{
        print("Wrong Answer !!!!!!!!!!");
        if let corerctOption = currentQuestion.options.firstIndex(of:currentQuestion.answer)
        {
          print("Correct answer : option \(corerctOption+1) : \(currentQuestion.answer)")
        }

        let totalAmountEarned = self.user.prize.getIncorrectWinningAmount();
        print("You have reached question \(qno)!")
        print("You have earned Total Amount : $\(totalAmountEarned)");
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