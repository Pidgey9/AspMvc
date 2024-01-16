using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace ProjetAspnet.Models
{
    public class DaoArticle
    {
        string connectionString = @"Data Source=DESKTOP-F1NS20D;Initial Catalog=RESTAURANT-AIRE-CS;Integrated Security=True";
        public bool Delete(int id)
        {
            string sql = "delete articles where id = " + id;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();
            int nb = command.ExecuteNonQuery();
            connection.Close();

            if (nb > 0)
                return true;
            return false;
        }
        public bool Update(Article a)
        {
            string sql = "update articles set article=@article,description=@description,prix=@prix where idArticle=@idArticle ";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = connection.CreateCommand();
            command.CommandText = sql;

            command.Parameters.Add("idArticle", SqlDbType.Int).Value = a.IdArticle;
            command.Parameters.Add("article", SqlDbType.NVarChar).Value = a.Nom;
            command.Parameters.Add("description", SqlDbType.NVarChar).Value = a.Description;
            command.Parameters.Add("prix", SqlDbType.Float).Value = a.Prix;

            connection.Open();
            int nb = command.ExecuteNonQuery();
            connection.Close();

            if (nb > 0)
                return true;
            return false;
        }
        public bool Insert(Article a)
        {
            string sql = "insert into articles values(@idArticle,@article,@description,@prix)";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = connection.CreateCommand();
            command.CommandText = sql;

            command.Parameters.Add("idArticle", SqlDbType.Int).Value = a.IdArticle;
            command.Parameters.Add("article", SqlDbType.NVarChar).Value = a.Nom;
            command.Parameters.Add("description", SqlDbType.NVarChar).Value = a.Description;
            command.Parameters.Add("prix", SqlDbType.Float).Value = a.Prix;

            connection.Open();
            int nb = command.ExecuteNonQuery();
            connection.Close();

            if (nb > 0)
                return true;
            return false;

        }
        public List<Article> SelectAll()
        {
            List<Article> liste = new List<Article>();
            string sql = "select * from articles";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                Article a = new Article(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetDouble(3));
                liste.Add(a);

            }
            connection.Close();

            return liste;
        }

        public Article SelectById(int id)
        {
            Article a = null;
            string sql = "select * from articles where idArticle=" + id;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
                a = new Article(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetDouble(3));
            connection.Close();

            return a;
        }
    }
}