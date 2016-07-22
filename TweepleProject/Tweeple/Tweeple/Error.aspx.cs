using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tweeple
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string error = Request.QueryString["Error"];
            lblErrorMsg.Text = error.ToString();
        }
       
        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session.Remove("Username");
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("SignIn.aspx");
        }
    }
}