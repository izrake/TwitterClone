using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Tweeple
{
    /// <summary>
    /// Summary description for ImageHandler1
    /// </summary>
    public class ImageHandler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string id = context.Request.QueryString["ID"] as string;
            SqlConnection conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);

            SqlCommand cmdObj = new SqlCommand("select * from UserDetail where user_id=@id", conObj);

            cmdObj.Parameters.AddWithValue("@id", id);
            if (conObj.State == ConnectionState.Closed)
            {
                conObj.Open();
            }

            SqlDataReader rdr = cmdObj.ExecuteReader();

            if (rdr.HasRows)
            {
                rdr.Read();
                if (rdr["UserImage"] != DBNull.Value)
                {

                    context.Response.BinaryWrite((byte[])rdr["UserImage"]);
                }
            }
            rdr.Close();
            conObj.Close();
            context.Response.End();

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}