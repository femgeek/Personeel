using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Membership.OpenAuth;

namespace Personeel.Account
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, createPersistentCookie: false);

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (!OpenAuth.IsLocalUrl(continueUrl))
            {
                continueUrl = "~/";
            }
            Session["Nummer"] = personeelsNr;

            Response.Redirect(continueUrl);
        }


        Int32 personeelsNr = new Int32();
        string[] namen = new String[2];

        protected void CustomValidatorUserName_ServerValidate(object source, ServerValidateEventArgs args)
        {

            string gebruikersNaam = RegisterUser.UserName;
            namen = gebruikersNaam.Split('.');

            SqlDataSourcePersoneel.SelectParameters["Voornaam"].DefaultValue = namen[0];
            SqlDataSourcePersoneel.SelectParameters["Naam"].DefaultValue = namen[1];
            DataView gebruikersInfo = (DataView)SqlDataSourcePersoneel.Select(DataSourceSelectArguments.Empty);

            if (gebruikersInfo.Count == 0)
                args.IsValid = false;
            else
            {
                args.IsValid = true;
                personeelsNr = (Int32)gebruikersInfo.Table.Rows[0]["Nummer"];
            }
        }

        protected void CustomValidatorPasWoord_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string pwdIngegeven = RegisterUser.Password;
            string pwdBerekend = namen[1] + "_" + personeelsNr;

            if (pwdIngegeven == pwdBerekend)
                args.IsValid = true;

            else
                args.IsValid = false;
        }
    }
}