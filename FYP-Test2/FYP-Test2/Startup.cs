using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FYP_Test2.Startup))]
namespace FYP_Test2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
