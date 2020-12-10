using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RockPaperScissors.APP
{
    class Computer
    {
        public Choice makeChoice(List<Choice> userChoices)
        {
            Choice choice = Choice.Scissors;
            

            if (true)
            {
                Random rnd = new Random();
                int selection = rnd.Next(1, 4);
                if(selection == 1)
                {
                    choice = Choice.Rock;
                }
                else if(selection == 2)
                {
                    choice = Choice.Paper;
                }
                else if (selection == 3)
                {
                    choice = Choice.Scissors;
                }

            }

            return choice;
        }
    }
}
