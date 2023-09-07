def pizza():
    cancle = "Thank you for using our chatbot."
    print("Instruction: type 'cancle' to exit the program")

    while (True):
        pizza = input("Select your pizza 'Pepperoni', 'Hawaiian', 'Deluxe': ")
        if (pizza == "cancle"):
            print(cancle)
            break
        else :
            size = input("Select size 'M', 'L': ")
            if (size == "cancle"):
                print(cancle)
                break
            else :
                crust = input("Select crust 'Pan', 'Thin': ")
                if (crust == "cancle"):
                    print(cancle)
                    break
                else :
                    sauce = input("Select sauce 'Thousand Island', 'Marinara', 'Pizza': ")
                    if (sauce == "cancle"):
                        print(cancle)
                        break
                    else :
                        name = input("What's your name?: ")
                        print("Please check!")
                        print(f"Order Name: {name}")
                        print(f"{pizza.title()} pizza")
                        print(f"Size: {size.title()}")
                        print(f"crust: {crust.title()}")
                        print(f"Sauce: {sauce.title()}")
                        confirm = input("Confirm Order? 'Yes', 'No': ")
                        if (confirm.lower() == "yes"):
                            print("Thank you for your order!")
                            break
