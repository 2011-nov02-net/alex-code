using System;
using System.Collections.Generic;
using System.Linq;

namespace RockPaperScissors.APP
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Lets Play Rock, Paper, Scissors!!");
            Console.WriteLine("---------------------------------------------------------------------------------------------");
            Console.WriteLine("Type 'R' for Rock, 'P' for Paper and 'S' for Scissors. Type 'Q' if you wish to quit. Type D if you want to see Game Board.");
            Char C = Console.ReadKey().KeyChar;
            Console.WriteLine("\n");

            List<Choice> userChoices = new List<Choice>();
            List<Choice> computerChoices = new List<Choice>();

            Computer computer = new Computer();

            Choice computerChoice = Choice.Rock;

            Choice choice = Choice.Rock;


            while(C != 'Q')
            {
                

                if (C == 'R')
                {
                    choice = Choice.Rock;
                    Console.WriteLine("You chose Rock.");
                }
                else if (C == 'P')
                {
                    choice = Choice.Paper;
                    Console.WriteLine("You chose Paper.");
                }
                else if (C == 'S')
                {
                    choice = Choice.Scissors;
                    Console.WriteLine("You chose Scissors.");
                }
                else if (C == 'D')
                {
                    displayGameBoard(userChoices, computerChoices);
                    C = 'K';
                }
                else
                {
                    Console.WriteLine("Choice not valid please try again.");
                    C = 'K';
                   
                }

                computerChoice = computer.makeChoice(userChoices);

                if ( C != 'K')
                {
                    

                    if (computerChoice == Choice.Rock)
                    {
                        Console.WriteLine("The computer has chosen Rock.");
                    }
                    else if (computerChoice == Choice.Paper)
                    {
                        Console.WriteLine("The computer has chosen Paper.");
                    }
                    else if (computerChoice == Choice.Scissors)
                    {
                        Console.WriteLine("The computer has chosen Scissors.");
                    }

                    if (computerChoice == choice)
                    {
                        Console.WriteLine("Its a Tie.");
                    }
                    else if ((choice == Choice.Rock && computerChoice == Choice.Scissors) || (choice == Choice.Paper && computerChoice == Choice.Rock) || (choice == Choice.Scissors && computerChoice == Choice.Paper))
                    {
                        Console.WriteLine("You Win! :)");
                    }
                    else if ((choice == Choice.Rock && computerChoice == Choice.Paper) || (choice == Choice.Paper && computerChoice == Choice.Scissors) || (choice == Choice.Scissors && computerChoice == Choice.Rock))
                    {
                        Console.WriteLine("You Loose! :(");

                    }

                    userChoices.Add(choice);
                    computerChoices.Add(computerChoice);
                }
                Console.WriteLine("---------------------------------------------------------------------------------------------");
                Console.WriteLine("\n");




                Console.WriteLine("Type 'R' for Rock, 'P' for Paper and 'S' for Scissors. Type 'Q' if you wish to quit. Type D if you want to see Game Board.");

                C = Console.ReadKey().KeyChar;

                Console.WriteLine("\n");

            }
            
        }

        static void displayGameBoard(List<Choice> usr, List<Choice> comp)
        {

            if(usr.Any() && comp.Any())
            {
                Console.WriteLine("---------------------------------------------------------------------------------------------");
                Console.WriteLine("\t \t" + "Round" + "\t \t" + "User" + "\t \t" + "Computer");
                Console.WriteLine("---------------------------------------------------------------------------------------------");
                string user = "";
                string computer = "";
                for (int i = 0; i < usr.Count; i++)
                {
                    if (usr[i] == Choice.Rock)
                    {
                        user = "Rock";
                    }
                    else if (usr[i] == Choice.Paper)
                    {
                        user = "Paper";
                    }
                    else if (usr[i] == Choice.Scissors)
                    {
                        user = "Scissor";
                    }

                    if (comp[i] == Choice.Rock)
                    {
                        computer = "Rock";
                    }
                    else if (usr[i] == Choice.Paper)
                    {
                        computer = "Paper";
                    }
                    else if (usr[i] == Choice.Scissors)
                    {
                        computer = "Scissor";
                    }


                    Console.WriteLine("\t \t" + i + "\t \t" + user + "\t \t" + computer);


                }
            }
            else
            {
                Console.WriteLine("Play at least once to see Game Board.");
            }
            
            
        }
    }
}
