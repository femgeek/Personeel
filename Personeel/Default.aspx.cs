using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Personeel.Account
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (User.Identity.Name.ToString() != "admin")
                {
                    string[] namen = User.Identity.Name.ToString().Split('.');
                    SqlDataSourcePersoneel.SelectParameters["Voornaam"].DefaultValue = namen[0];
                    SqlDataSourcePersoneel.SelectParameters["Naam"].DefaultValue = namen[1];
                    DataView gebruikersInfo = (DataView)SqlDataSourcePersoneel.Select(DataSourceSelectArguments.Empty);
                    Session["Nummer"] = (Int32)gebruikersInfo.Table.Rows[0]["Nummer"];
                    Response.Redirect("~/LoggedIn");
                }
                else
                    Response.Redirect("~/Overview");

                //MembershipUser gebruiker = Membership.GetUser(User.Identity.Name);
                //if (Roles.IsUserInRole(gebruiker.UserName, "beheerders"))
                //    Response.Redirect("~/Overview");
                //else
                //    Response.Redirect("~/LoggedIn");
            }

            RegisterHyperLink.NavigateUrl = "Register";
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }



        protected void loginGebruiker_LoggedIn(object sender, EventArgs e)
        {
            MembershipUser gebruiker = Membership.GetUser(loginGebruiker.UserName);
            if (Roles.IsUserInRole(gebruiker.UserName, "beheerders"))
                Response.Redirect("~/Overview");
            else
                Response.Redirect("~/LoggedIn");
        }

        protected void loginGebruiker_LoggingIn(object sender, LoginCancelEventArgs e)
        {
            TextBox paswoord = (TextBox)loginGebruiker.FindControl("Password");
            string[] pwds = paswoord.Text.ToString().Split('_');
            Session["Nummer"] = Convert.ToInt32(pwds[1]);
        }
    }
}