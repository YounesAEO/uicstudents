using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionBancaire
{
    class Program
    {
        static void Main(string[] args)
        {
            CompteCourant cptCourant1 = new CompteCourant(2000);
            cptCourant1.Proprietaire = "Nicolas";

            CompteEpargneEntreprise cptEpargneEse = new CompteEpargneEntreprise(0.02);
            cptEpargneEse.Proprietaire = "Nicolas";

            CompteCourant cptCourant2 = new CompteCourant(500);
            cptCourant2.Proprietaire = "Jeremy";

            cptCourant1.Crediter(100);
            cptCourant1.Debiter(50);
            cptCourant1.Debiter(20, cptEpargneEse);

            cptEpargneEse.Crediter(100);
            cptEpargneEse.Debiter(20, cptCourant1);

            cptCourant2.Debiter(500);
            cptCourant2.Debiter(200, cptCourant1);

            cptCourant1.AfficherResume();

            cptEpargneEse.AfficherResume();

            Console.ReadKey();

        }
        
    }
}
