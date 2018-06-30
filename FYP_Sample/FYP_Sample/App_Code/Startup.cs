using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FYP_Sample.Startup))]
namespace FYP_Sample
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
