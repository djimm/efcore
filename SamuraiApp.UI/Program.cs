using SamuraiApp.Data;
using SamuraiApp.Domain;
using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace SamuraiApp.UI
{
    public static class Program
    {

        private static SamuraiContext _context = new SamuraiContext();
        static void Main(string[] args)
        {
            _context.Database.EnsureCreated();
            AddSamuraisByName("Whatta1", "Heuhst1", "Kejo", "Arnulx");
            GetSamurais("");
            Console.WriteLine("Trykk en tast...");
            Console.ReadKey();
        }

        private static void AddSamuraisByName(params string[] names)
        {
            foreach (string name in names)
            {
                _context.Samurais.Add(new Samurai { Name = name });
            }
            _context.SaveChanges();
        }

        private static void GetSamurais(string text)
        {
            var samurais = _context.Samurais
                .TagWith("ConsoleApp.Program.GetSamurais method")
                .ToList();
            Console.WriteLine($"{text}: Antall samuraier {samurais.Count}");
            foreach (var samurai in samurais)
            {
                Console.WriteLine(samurai.Name);
            }
        }
    }
}
