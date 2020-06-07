using Autofac;
using LineaSupermercado.UI.Data;
using LineaSupermercado.UI.ViewModel;
using LineaSupermercado.DataAccess;

namespace LineaSupermercado.UI.Startup
{
    public class Bootstrapper
    {
        public IContainer Bootstrap()
        {
            var builder = new ContainerBuilder();
            builder.RegisterType<LineaSupermercadoDbContext>().AsSelf();
            builder.RegisterType<MainWindow>().AsSelf();
            builder.RegisterType<MainViewModel>().AsSelf(); 
            builder.RegisterType<LineaSupermercadoDataService>().As<ILineaSupermercadoDataService>();

            return builder.Build();
        }
    }
}
