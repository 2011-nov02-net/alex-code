using System;

namespace SlackChallenge
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Multiword Term:");
            string input = Console.ReadLine();
            string[] words = input.Split(' ');
            String acronym = "";
            foreach (var item in words)
            {
               acronym += item.ToUpper()[0];

            }
            Console.WriteLine($"{acronym}");



        }
    }
}
