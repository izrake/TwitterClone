using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

namespace Tweeple
{
    public class DataManager
    {
        public static void ErrorLog(Exception ex)
        {
            string path = HttpContext.Current.Server.MapPath("ErrorLog.txt");
            StreamWriter sw = new StreamWriter(path);
            StringBuilder sb = new StringBuilder();
            if (ex.InnerException != null)
            {
                sb.Append("---------Error-----Date-------------" + DateTime.Now.ToString());
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Error Type" + ex.InnerException.GetType());
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Error Message:" + ex.InnerException.Message);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Error Source:" + ex.InnerException.Source);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Stack Trace:" + ex.InnerException.StackTrace);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);

            }
            if (ex != null)
            {
                sb.Append("---------Error-----Date-------------" + DateTime.Now.ToString());
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Error Type" + ex.GetType());
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Error Message:" + ex.Message);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Error Source:" + ex.Source);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Stack Trace:" + ex.StackTrace);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
            }

            sw.WriteLine(sb.ToString());
            sb.Clear();
            sw.Close();



        }
    }
}