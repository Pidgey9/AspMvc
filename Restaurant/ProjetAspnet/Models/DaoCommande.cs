using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace ProjetAspnet.Models
{
    public class DaoCommande
    {
        string connectionString = @"Data Source=DESKTOP-F1NS20D;Initial Catalog=RESTAURANT-AIRE-CS;Integrated Security=True";
        public bool Delete(int id)
        {
            string sql = "delete commandes where id = " + id;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();
            int nb = command.ExecuteNonQuery();
            connection.Close();

            if (nb > 0)
                return true;
            return false;
        }
        public bool Update(Commande c)
        {
            string sql = "update commandes set idClient=@idClient,date=@date,prixTotal=@prixTotal,infos=@infos where id=@id ";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = connection.CreateCommand();
            command.CommandText = sql;

            command.Parameters.Add("id", SqlDbType.Int).Value = c.Id;
            command.Parameters.Add("idClient", SqlDbType.Int).Value = c.IdClient;
            command.Parameters.Add("date", SqlDbType.Date).Value = c.Date;
            command.Parameters.Add("prixTotal", SqlDbType.Float).Value = c.PrixTotal;
            command.Parameters.Add("infos", SqlDbType.NVarChar).Value = c.Infos;

            connection.Open();
            int nb = command.ExecuteNonQuery();
            connection.Close();

            if (nb > 0)
                return true;
            return false;
        }
        public bool Insert(Commande c)
        {
            string sql = "insert into commandes values(@idClient,@date,@prixTotal,@infos)";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = connection.CreateCommand();
            command.CommandText = sql;

            command.Parameters.Add("idClient", SqlDbType.Int).Value = c.IdClient;
            command.Parameters.Add("date", SqlDbType.Date).Value = c.Date;
            command.Parameters.Add("prixTotal", SqlDbType.Float).Value = c.PrixTotal;
            command.Parameters.Add("infos", SqlDbType.NVarChar).Value = c.Infos;

            connection.Open();
            int nb = command.ExecuteNonQuery();
            connection.Close();

            if (nb > 0)
                return true;
            return false;

        }
        public List<Commande> SelectAll()
        {
            List<Commande> liste = new List<Commande>();
            string sql = "select * from commandes";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                Commande c = new Commande(reader.GetInt32(0), reader.GetInt32(1), reader.GetDateTime(2), reader.GetDouble(3), reader.GetString(4));
                liste.Add(c);

            }
            connection.Close();

            return liste;
        }

        public Commande SelectById(int id)
        {
            Commande c = null;
            string sql = "select * from commandes where id=" + id;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
                c = new Commande(reader.GetInt32(0), reader.GetInt32(1), reader.GetDateTime(2), reader.GetDouble(3), reader.GetString(4));
            connection.Close();

            return c;
        }
    }
}