using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionBancaire
{
    class CompteEpargneEntreprise : Compte
    {
        private double tauxAbonnement;

        public CompteEpargneEntreprise(double tauxAbonnementParam)
        {
            if (tauxAbonnementParam > 0 && tauxAbonnementParam < 1)
                tauxAbonnement = tauxAbonnementParam;
        }


        public override void Crediter(decimal Somme)
        {
            Solde += Somme;
            ListeOperations.Add(Somme + ", crédit");
        }

        public void Crediter(decimal Somme, CompteEpargneEntreprise compte)
        {
            Solde += Somme;
            ListeOperations.Add(Somme + ", crédit");
            compte.Debiter(Somme);
        }

        public override void Debiter(decimal Somme)
        {
            Solde -= Somme;
            ListeOperations.Add(Somme + ", débit");
        }

        public void Debiter(decimal Somme, CompteEpargneEntreprise compte)
        {
            Solde -= Somme;
            ListeOperations.Add(Somme + ", débit");
            compte.Crediter(Somme);
        }

        public void AfficherResume()
        {
            Console.WriteLine("Résumé du compte épargne de " + Proprietaire);
            Console.WriteLine("###################################################");
            Console.WriteLine("Compte épargne entreprise de " + Proprietaire);
            Console.WriteLine("                   Solde : " + Solde);
            Console.WriteLine("                   Taux : " + tauxAbonnement);
            Console.WriteLine();
            Console.WriteLine("Opérations :");
            foreach (string operation in ListeOperations)
                Console.WriteLine(operation);
            Console.WriteLine("###################################################");
        }
    }
}
