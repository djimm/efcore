using SamuraiApp.Data;
using SamuraiApp.Domain;
using System;
using System.Linq;

namespace SamuraiApp.UI
{
    class Program
    {

        private static SamuraiContext _context = new SamuraiContext();
        static void Main(string[] args)
        {
            _context.Database.EnsureCreated();
            GetSamurais("Før add:");
            addSamurai();
            GetSamurais("Etter add:");
            Console.WriteLine("Trykk en tast...");
            Console.ReadKey();
        }

        private static void addSamurai()
        {
            var samurai = new Samurai { Name = "kejo" };
            _context.Samurais.Add(samurai);
            _context.SaveChanges();
        }

        private static void GetSamurais(string text)
        {
            var samurais = _context.Samurais.ToList();
            Console.WriteLine($"{text}: Antall samuraier {samurais.Count}");
            foreach (var samurai in samurais)
            {
                Console.WriteLine(samurai.Name);
            }
        }
    }
}
