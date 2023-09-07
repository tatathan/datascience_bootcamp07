def game():
    from random import sample
    print("Instruction: type 'exit' to exit the programe")
    print("Start!")
    options = ["hammer","scissor","paper"]
    print(options)
    point = 0

    while True:
        user_select = input("Choose one: ")
        computer_select = sample(options, 1)[0]

        if user_select == "exit":
            print("Thx for playing")
            break
        elif (user_select == computer_select):
            print("tie!")
        elif (((user_select == "hammer") and (computer_select == "scissor")) or 
          ((user_select == "scissor") and (computer_select == "paper")) or 
          ((user_select == "paper") and (computer_select == "hammer"))):
            print ("You Win!, +1point")
            point += 1
        else :
            print ("You lose")
        
        print(f"Computer Select: {computer_select}")
        print(f"You have {point} points.")
