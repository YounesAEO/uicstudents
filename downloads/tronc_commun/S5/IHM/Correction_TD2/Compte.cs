using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionBancaire
{
    class Compte
    {
        protected decimal Solde;
        public string Proprietaire;
        protected List<string> ListeOperations;

        public Compte()
        {
            ListeOperations = new List<string>();
        }

        public virtual void Crediter(decimal Somme)
        {
            Solde += Somme;
            ListeOperations.Add("+" + Somme);
        }

        public virtual void Crediter(decimal Somme, Compte compteParam)
        {
            Solde += Somme;
            ListeOperations.Add("+" + Somme);

            compteParam.Debiter(Somme);

        }

        public virtual void Debiter(decimal Somme)
        {
            Solde -= Somme;
            ListeOperations.Add("-" + Somme);
        }

        public virtual void Debiter(decimal Somme, Compte compteParam)
        {
            Solde -= Somme;
            ListeOperations.Add("-" + Somme);

            compteParam.Crediter(Somme);

        }
    }
}
