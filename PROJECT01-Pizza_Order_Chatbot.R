
pizza_chatbot <- function() {
  
  cancle = "Thank you for using our chatbot."
  print("Instruction: type 'cancle' to exit the program")
  
  while (TRUE) {
    text = readline("Select your pizza 'Pepperoni', 'Hawaiian', 'Deluxe': ")
    if (text == "cancle") {
      print(cancle)
      break
    } else {
      size = readline("Select size 'M', 'L': ")
      if (size == "cancle"){
        print(cancle)
        break
      } else {
        crust = readline("Select crust 'Pan', 'Thin': ")
        if (crust == "cancle"){
          print(cancle)
          break
        } else {
          sauce = readline("Select sauce 'Thousand Island', 'Marinara', 'Pizza': ")
          if (sauce == "cancle"){
            print(cancle)
            break
          } else {
            name = readline("What's your name?: ")
            print("Please check!")
            print(paste("Order Name:", name))
            print(paste(text, 'pizza'))
            print(paste('Size:', size))
            print(paste('crust:', crust))
            print(paste('Sauce:', sauce))
            confirm = readline("Confirm Order? 'Yes', 'No': ")
            if (tolower(confirm) == "yes") {
              print("Thank you for your order!")
              break
            }
          }
        }
      }
    }
  }
}
