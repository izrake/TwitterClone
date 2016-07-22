﻿using System;
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
    public partial class SearchUser : System.Web.UI.Page
    {
        SqlConnection conObj = new SqlConnection();
        SqlCommand cmdObj = new SqlCommand();
        string mainuser = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Session["Username"].Equals(""))
                {
                    //SuggestionLoad();
                    DataSearch();
                    followersCount();
                    followingCount();
                    
                }
                else
                {
                    Response.Redirect("SignIn.aspx");
                }
            }

        }

        private void DataSearch()
        {
            string search = Request.QueryString["Search"].ToString();
            string asd = Session["Username"].ToString();
            lblUsername.Text = asd;
            imgUserSearch.ImageUrl = "~/ImageHandler1.ashx?ID=" + asd;
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            cmdObj = new SqlCommand("proc_search", conObj);
            cmdObj.CommandType = CommandType.StoredProcedure;
            cmdObj.Parameters.AddWithValue("@term", search);
            string user = Session["Username"].ToString();
            cmdObj.Parameters.AddWithValue("@user", user);
            if (conObj.State == ConnectionState.Closed)
            { conObj.Open(); }
            SqlDataAdapter adapter = new SqlDataAdapter(cmdObj);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Suggestion");
            dtsearchcontent.DataSource = ds.Tables["Suggestion"];
            dtsearchcontent.DataBind();
        }

      

        private void followingCount()
        {
            string asd = Session["Username"].ToString();
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
            string asd = Session["Username"].ToString();
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

        protected void searchsign_Click(object sender, EventArgs e)
        {
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            cmdObj = new SqlCommand("proc_search", conObj);
            cmdObj.CommandType = CommandType.StoredProcedure;
            cmdObj.Parameters.AddWithValue("@term", searchtext.Text);
            cmdObj.Parameters.AddWithValue("@user", Session["Username"].ToString());
            if (conObj.State == ConnectionState.Closed)
            { conObj.Open(); }
            SqlDataAdapter adapter = new SqlDataAdapter(cmdObj);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Suggestion");
            dtsearchcontent.DataSource = ds.Tables["Suggestion"];
            dtsearchcontent.DataBind();

        }

        protected void dtsearchcontent_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "passUserId")
            {
                string userid = e.CommandArgument.ToString();
                UplaodFollowings(userid);
            }
        }
        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("TweepleWelcome.aspx");
        }



    }
}