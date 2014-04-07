using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using Personeel;


namespace Personeel
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            RegisterRoutes(RouteTable.Routes);
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("naarRegister", "register", "~/Account/Register.aspx");
            routes.MapPageRoute("naarOverview", "overview", "~/Overview.aspx");
            routes.MapPageRoute("naarAdmin", "personeelsleden/admin", "~/Overview.aspx");
            routes.MapPageRoute("naarLoggedIn", "LoggedIn", "~/LoggedIn.aspx");
            routes.MapPageRoute("naarDetails", "personeelsleden/{Nummer}", "~/LoggedIn.aspx");
            routes.MapPageRoute("naarGeenDetails", "personeelsleden", "~/LoggedIn.aspx");

        }
    }
}
