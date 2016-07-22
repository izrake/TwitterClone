using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Tweeple
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conObj = new SqlConnection();
        SqlCommand cmdObj = new SqlCommand();
        string mainuser = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SuggestionLoad();
            }
        }
        private void SuggestionLoad()
        {

            string asd = Session["Username"].ToString();

            //this is for the following counts
            followingCount();
            ///This is for the followers count
            followersCount();



            SqlCommand cmdObj = new SqlCommand("select * from UserDetail where [user_id] not in (select following_id from Following where [user_id]=@asd ) and [user_id] !=@asd", conObj);
            cmdObj.Parameters.AddWithValue("@asd", asd);
            if (conObj.State == ConnectionState.Closed)
            {
                conObj.Open();
            }
            SqlDataAdapter adapter = new SqlDataAdapter(cmdObj);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Suggestion");
            DataUpload.DataSource = ds.Tables["Suggestion"];
            DataUpload.DataBind();
            cmdObj.Dispose();
            conObj.Close();

        }

        private void followingCount()
        {
            string asd = Session["Username"].ToString();
             conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            SqlCommand cmdObj1 = new SqlCommand("select Count(*) from Following WHERE USER_ID=@asd", conObj);
            cmdObj1.Parameters.AddWithValue("@asd", asd);
            if (conObj.State == ConnectionState.Closed)
            {
                conObj.Open();
            }

            SqlDataReader rdr = cmdObj1.ExecuteReader();
            rdr.Read();
            if (rdr.HasRows)
            {
                lblFollowings.Text = rdr[0].ToString();
            }
            rdr.Close();
            cmdObj1.Dispose();
            conObj.Close();
        }

        private void followersCount()
        {
            string asd = Session["Username"].ToString();
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            SqlCommand cmdObj2 = new SqlCommand("select Count(*) from Following WHERE following_id=@asd", conObj);
            cmdObj2.Parameters.AddWithValue("@asd", asd);
            if (conObj.State == ConnectionState.Closed)
            {
                conObj.Open();
            }

            SqlDataReader rdr1 = cmdObj2.ExecuteReader();
            rdr1.Read();
            if (rdr1.HasRows)
            {
                lblFollower.Text = rdr1[0].ToString();
            }
            rdr1.Close();
            cmdObj2.Dispose();
            conObj.Close();
        }

        
        protected void DataUpload_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Follow")
            {
                string userid = e.CommandArgument.ToString();
                UplaodFollowings(userid);

            }
        }
        private void UplaodFollowings(string userid)
        {

            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            cmdObj = new SqlCommand("followingProcedure", conObj);
            cmdObj.CommandType = CommandType.StoredProcedure;
            mainuser = Session["Username"].ToString();
            cmdObj.Parameters.AddWithValue("@userid", mainuser);
            cmdObj.Parameters.AddWithValue("@followingid", userid);
            if (conObj.State == ConnectionState.Closed)
            {
                conObj.Open();

            }
            int res = cmdObj.ExecuteNonQuery();
            
            cmdObj.Dispose();
            conObj.Close();
            Response.Redirect(Request.RawUrl);

        }
    }
}