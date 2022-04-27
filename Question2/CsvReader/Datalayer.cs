using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace CsvReader
{
    public class Datalayer
    {
        public Datalayer() { }

        public void AddBaseProject(DataSet dtCsv)
        { 
            try
            {
                var connectionString = ConfigurationManager.ConnectionStrings["csvConnection"].ConnectionString;
                using (MySqlConnection con = new (connectionString))
                {
                    con.Open();
                    foreach (DataTable dt in dtCsv.Tables)
                    {
                        using (MySqlTransaction tran = con.BeginTransaction(IsolationLevel.Serializable))
                        {
                            using (MySqlCommand cmd = new ())
                            {
                                cmd.Connection = con;
                                cmd.Transaction = tran;
                                cmd.CommandText = $"SELECT * FROM nsp_hunter.CsvTable limit 0";

                                using (MySqlDataAdapter adapter = new MySqlDataAdapter(cmd))
                                {
                                    adapter.UpdateBatchSize = 10000;
                                    using (MySqlCommandBuilder cb = new (adapter))
                                    {
                                        cb.SetAllValues = true;
                                        adapter.Update(dt);
                                        tran.Commit();
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception AddBaseProject Message : {ex}, Exception AddBaseProject : {ex}");
            }
        }

    }
}