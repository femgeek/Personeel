using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Personeel
{
    public partial class LoggedIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Nummer"] == null)
            {
                string[] namen = User.Identity.Name.ToString().Split('.');
                SqlDataSourcePersoneel2.SelectParameters["Voornaam"].DefaultValue = namen[0];
                SqlDataSourcePersoneel2.SelectParameters["Naam"].DefaultValue = namen[1];
                DataView gebruikersInfo = (DataView)SqlDataSourcePersoneel2.Select(DataSourceSelectArguments.Empty);
                Session["Nummer"] = (Int32)gebruikersInfo.Table.Rows[0]["Nummer"];
            }


            Int32 personeelsNr = new Int32();

            if (this.RouteData.Values["Nummer"] == null)
                personeelsNr = (Int32)Session["Nummer"];
            else
            {
                try
                {
                    personeelsNr = Convert.ToInt32(this.RouteData.Values["Nummer"]);
                }
                catch
                {
                    personeelsNr = 0;
                }
            }

            SqlDataSourcePersoneel.SelectParameters["Nummer"].DefaultValue = Convert.ToString(personeelsNr);

        }
    }
}