using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace GISPuskesmasLib
{
    public class Database
    {
        public static string GetCon
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["GISPuskesmasData"].ConnectionString;
            }
        }
    }
}
