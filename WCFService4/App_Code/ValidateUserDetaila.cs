using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for ValidateUserDetaila
/// </summary>
public class ValidateUserDetaila:IValidateUser
{

    public bool validate(string username, string password)
    {
        SqlConnection conObj = new SqlConnection("Data Source=192.168.1.74;Initial Catalog=Tweeple;User Id=sa;Password=welcome");
        SqlCommand cmdObj = new SqlCommand("select FirstName from UserDetail where [user_id]=@userid and [password]=@psw and active=1", conObj);
        cmdObj.Parameters.AddWithValue("@userid",username);
        cmdObj.Parameters.AddWithValue("@psw", password);
        if (conObj.State == ConnectionState.Closed)
            conObj.Open();
        SqlDataReader rdr = cmdObj.ExecuteReader();
        rdr.Read();
        if (rdr.HasRows)
            return true;
        else
            return false;

    }
}