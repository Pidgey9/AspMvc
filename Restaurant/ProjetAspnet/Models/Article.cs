using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetAspnet.Models
{
    public class Article
    {
        private int idArticle;
        private string article;
        private string description;
        private double prix;
        public Article()
        {

        }
        public Article(int idArticle, string article, string description, double prix)
        {
            this.idArticle = idArticle;
            this.article = article;
            this.description = description;
            this.prix = prix;
        }
        public int IdArticle
        {
            get { return idArticle; }
            set { idArticle = value; }
        }
        public string Nom
        {
            get { return article; }
            set { article = value; }
        }
        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        public double Prix
        {
            get { return prix; }
            set { prix = value; }
        }
    }
}