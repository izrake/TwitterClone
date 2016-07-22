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
    public partial class SignIn : System.Web.UI.Page
    {
        SqlConnection conObj = new SqlConnection();
        SqlCommand cmdObj = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["Username"] != null && Request.Cookies["Password"] != null)
                {
                    txtUserSignInName.Text = Request.Cookies["Username"].Value;
                    //txtUserSignInPass.Text = Request.Cookies["Password"].Value;
                    txtUserSignInPass.Attributes.Add("value", Request.Cookies["Password"].Value);
                }
            }
        }

        protected void cmdRegister_Click(object sender, EventArgs e)
        {
            conObj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConCGI"].ConnectionString);
            SqlCommand cmdObj = new SqlCommand("insertSignUpData", conObj);
            cmdObj.CommandType = CommandType.StoredProcedure;
            cmdObj.Parameters.AddWithValue("@userid", txtUsername.Text.Trim().ToLower());
            cmdObj.Parameters.AddWithValue("@psw", txtPassword.Text.Trim());
            cmdObj.Parameters.AddWithValue("@frstname", txtFirstName.Text);
            cmdObj.Parameters.AddWithValue("@lstname", txtLastName.Text);
            cmdObj.Parameters.AddWithValue("@email", txtEmailId.Text);
            cmdObj.Parameters.AddWithValue("@city", txtCity.Text);
            cmdObj.Parameters.AddWithValue("@mobileno", txtMobileNo.Text);

            if (conObj.State == ConnectionState.Closed)
                conObj.Open();

            int res = cmdObj.ExecuteNonQuery();


            txtEmailId.Text = "";
            txtCity.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtMobileNo.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";

            cmdObj.Dispose();
            conObj.Close();
        }

        protected void cmdSignIn_Click(object sender, EventArgs e)
        {
            if (chkRemember.Checked)
            {
                Response.Cookies.Add(new HttpCookie("Username", txtUserSignInName.Text.ToLower()));
                Response.Cookies["Username"].Expires = DateTime.Now.AddDays(7);
                Response.Cookies.Add(new HttpCookie("Password", txtUserSignInPass.Text.Trim()));
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(7);
            }
            else
            {
                Response.Cookies["Username"].Value = "";
                Response.Cookies["Password"].Value = "";
            }
            ServiceReference1.ValidateUserClient va = new ServiceReference1.ValidateUserClient();

            bool result = va.validate(txtUserSignInName.Text, txtUserSignInPass.Text);
            if (result)
            {
                Session["Username"] = txtUserSignInName.Text;
                Response.Redirect("TweepleWelcome.aspx");
            }
            else
                Response.Redirect("SignIn.aspx");

       
        }
    }
}