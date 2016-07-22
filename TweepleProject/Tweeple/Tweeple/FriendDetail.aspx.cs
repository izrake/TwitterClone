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
    public partial class FriendDetail : System.Web.UI.Page
    {
        SqlConnection conObj = new SqlConnection();
        SqlCommand cmdObj = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Session["Username"].ToString().Equals(""))
                {
                    lblUsername.Text = Session["Username"].ToString();
                    TweetLoad();
                    tweetCount();
                    followersCount();
                    followingCount();
                    LoadFollowers();
                    LoadFollowing();
                }
                else
                    Response.Redirect("SignIn.aspx");
            }
           

        }
        private void TweetLoad()
        {
            string asd = Request.QueryString["User"].ToString();
            imgUserImage.ImageUrl = "~/ImageHandler1.ashx?ID=" + asd;
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            SqlCommand cmdObj = new SqlCommand("select * from Tweet where user_id=@asd", conObj);
            
            cmdObj.Parameters.AddWithValue("@asd", asd);
            if (conObj.State == ConnectionState.Closed)
            {
                conObj.Open();
            }
            SqlDataAdapter adapter = new SqlDataAdapter(cmdObj);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Tweets");
            dlTweets.DataSource = ds.Tables["Tweets"];
            dlTweets.DataBind();


        }

        private void tweetCount()
        {

            string asd = Request.QueryString["User"].ToString();
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            SqlCommand cmdObj1 = new SqlCommand("select Count(*) from Tweet WHERE user_id=@asd", conObj);
            cmdObj1.Parameters.AddWithValue("@asd", asd);

            conObj.Open();


            SqlDataReader rdr = cmdObj1.ExecuteReader();
            rdr.Read();
            if (rdr.HasRows)
            {
                lblTweets.Text = rdr[0].ToString();
            }
            rdr.Close();
            cmdObj1.Dispose();
            conObj.Close();

        }


        private void followingCount()
        {
            string asd = Request.QueryString["User"].ToString();   
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            SqlCommand cmdObj1 = new SqlCommand("select Count(*) from Following WHERE user_id=@asd", conObj);
            cmdObj1.Parameters.AddWithValue("@asd", asd);

            conObj.Open();


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
            string asd = Request.QueryString["User"].ToString();
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);

            SqlCommand cmdObj2 = new SqlCommand("countFollowers", conObj);
            cmdObj2.CommandType = CommandType.StoredProcedure;
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

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session.Remove("Username");
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("SignIn.aspx");
        }
        private void LoadFollowers()
        {
            string asd = Request.QueryString["User"].ToString();
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            SqlCommand cmdObj = new SqlCommand("findFollowers", conObj);
            cmdObj.CommandType = CommandType.StoredProcedure;
            cmdObj.Parameters.AddWithValue("@asd", asd);
            if (conObj.State == ConnectionState.Closed)
            {
                conObj.Open();
            }
            SqlDataAdapter adapter = new SqlDataAdapter(cmdObj);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Followers");
            dlShowFollowers.DataSource = ds.Tables["Followers"];
            dlShowFollowers.DataBind();
        }

        private void LoadFollowing()
        {
            string asd = Request.QueryString["User"].ToString();
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            SqlCommand cmdObj = new SqlCommand("findFollowings", conObj);
            cmdObj.CommandType = CommandType.StoredProcedure;
            cmdObj.Parameters.AddWithValue("@asd", asd);
            if (conObj.State == ConnectionState.Closed)
            {
                conObj.Open();
            }
            SqlDataAdapter adapter = new SqlDataAdapter(cmdObj);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Followings");
            dlShowFollowings.DataSource = ds.Tables["Followings"];
            dlShowFollowings.DataBind();
        }

        protected void dlShowFollowers_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "passUserId")
            {
                string userid = e.CommandArgument.ToString();
                Response.Redirect("FriendDetail.aspx?User=" + userid);
            }
        }

        protected void dlShowFollowings_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "passUserId")
            {
                string userid = e.CommandArgument.ToString();
                Response.Redirect("FriendDetail.aspx?User=" + userid);
            }
        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("TweepleWelcome.aspx");
        }


    }
}