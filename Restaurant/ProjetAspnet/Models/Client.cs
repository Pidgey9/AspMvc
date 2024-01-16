using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetAspnet.Models
{
    public class Client
    {
        private int id;
        private string password;
        private string nom;
        private string prenom;
        private string adresse;
        public Client()
        {

        }
        public Client(int id, string password, string nom, string prenom, string adresse)
        {
            this.id = id;
            this.password = password;
            this.nom = nom;
            this.prenom = prenom;
            this.adresse = adresse;
        }
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string Nom
        {
            get { return nom; }
            set { nom = value; }
        }
        public string Prenom
        {
            get { return prenom; }
            set { prenom = value; }
        }
        public string Adresse
        {
            get { return adresse; }
            set { adresse = value; }
        }
    }
}