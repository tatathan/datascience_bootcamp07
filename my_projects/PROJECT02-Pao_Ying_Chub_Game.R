
game <- function(){
  print("Instruction: type 'exit' to exit the programe")
  print("Start!")
  options <- c("hammer","scissor","paper")
  print(options)
  point<-0
  
  
  while (TRUE) {
    
    user_select <- readline("Choose one: ")
    computer_select <- sample(options,1)
    
    if (user_select == "exit") {
      print("Thx for playing")
      break
    } else if (user_select == computer_select){
      print("tie!")
    } else if 
    (((user_select == "hammer") & (computer_select == "scissor")) |
     ((user_select == "scissor") & (computer_select == "paper")) |
     ((user_select == "paper") & (computer_select == "hammer"))) {
      print ("You Win!, +1point")
      point=point+1
    } else {
      print ("You lose")
    }
    p<-paste("You have", point, "points.")
    print(paste("Computer Select:",computer_select))
    print(p)
    
  }
}
