using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Personeel
{
    public partial class Overview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Details_Click(object sender, EventArgs e)
        {
            Button detailsButton = (Button)sender;
            Response.Redirect("~/personeelsleden/" + detailsButton.CommandArgument);
        }
    }
}