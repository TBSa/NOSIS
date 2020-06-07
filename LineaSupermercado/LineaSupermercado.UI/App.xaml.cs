using Autofac;
using LineaSupermercado.UI.Data;
using LineaSupermercado.UI.Startup;
using LineaSupermercado.UI.ViewModel;
using System.Windows;

namespace LineaSupermercado.UI
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private void Application_Startup(object sender, StartupEventArgs e)
        {
            var bootstrapper = new Bootstrapper();
            var container = bootstrapper.Bootstrap();

            var mainWindow = container.Resolve<MainWindow>();

            mainWindow.Show();
        }
    }
}
