import random

def get_difficulty():
    while True:
        print("Choose a difficulty level: Easy, Medium, or Hard")
        difficulty = input("Enter difficulty: ").strip().lower()
        if difficulty == "easy":
            return 1, 50, 10
        elif difficulty == "medium":
            return 1, 100, 7
        elif difficulty == "hard":
            return 1, 200, 5
        else:
            print("Invalid choice. Please choose Easy, Medium, or Hard.")

def guess_the_number():
    print("🎉 Welcome to the Guess the Number Game!")

    best_score = None

    while True:
        lower_bound, upper_bound, max_attempts = get_difficulty()
        secret_number = random.randint(lower_bound, upper_bound)
        attempts = 0

        print(f"\nI'm thinking of a number between {lower_bound} and {upper_bound}. You have {max_attempts} attempts to guess it.")

        while attempts < max_attempts:
            try:
                guess = int(input(f"Attempt {attempts + 1}: Enter your guess: "))
                if guess < lower_bound or guess > upper_bound:
                    print(f"Please enter a number between {lower_bound} and {upper_bound}.")
                    continue

                attempts += 1

                if guess < secret_number:
                    print("Too low! Try again.")
                elif guess > secret_number:
                    print("Too high! Try again.")
                else:
                    print(f"🎉 Congratulations! You guessed the number {secret_number} in {attempts} attempts!")
                    if best_score is None or attempts < best_score:
                        best_score = attempts
                        print("🔥 New best score!")
                    break

                if attempts == 3:
                    hint = "even" if secret_number % 2 == 0 else "odd"
                    print(f"Hint: The number is {hint}.")

            except ValueError:
                print("Invalid input. Please enter a valid number.")

        if attempts == max_attempts and guess != secret_number:
            print(f"😢 Sorry, you've used all your attempts. The number was {secret_number}.")

        print("\nDo you want to play again? (yes/no)")
        if input().strip().lower() != "yes":
            print(f"Thanks for playing! Your best score was {best_score} attempt(s)." if best_score else "Thanks for playing!")
            break

if __name__ == "__main__":
    guess_the_number()
