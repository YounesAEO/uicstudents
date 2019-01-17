using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionBancaire
{
    class CompteCourant : Compte
    {
        private decimal decouvert;
        public CompteCourant(decimal decouvertParam)
        {
            decouvert = decouvertParam;
        }
    
        public void AfficherResume()
        {
            Console.WriteLine("Résumé du compte de " + Proprietaire);
            Console.WriteLine("************************************************");
            Console.WriteLine("Compte courant de " + Proprietaire);
            Console.WriteLine("                   Solde : " + Solde);
            Console.WriteLine("                   Découvert autorisé : " + decouvert);
            Console.WriteLine();
            Console.WriteLine("Opérations :");
            foreach (string operation in ListeOperations)
                Console.WriteLine(operation);
            Console.WriteLine("************************************************");
        }
    }
}
