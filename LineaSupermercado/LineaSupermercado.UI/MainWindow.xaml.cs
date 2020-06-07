using System;
using System.Windows;
using LineaSupermercado.UI.ViewModel;
using LineaSupermercado.Model;

namespace LineaSupermercado.UI
{
    public partial class MainWindow : Window
    {
        private MainViewModel _viewModel;

        public MainWindow(MainViewModel viewModel)
        {
            InitializeComponent();
            _viewModel = viewModel;
            DataContext = _viewModel;
            Loaded += MainWindow_Loaded;
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            _viewModel.Load();
        }

        private void OpenSupermarketCheckout_Click(object sender, RoutedEventArgs e)
        {
            _viewModel.AddSupermarketChekout();
            _viewModel.Load();
        }

        private void CloseSupermarketCheckout_Click(object sender, RoutedEventArgs e)
        {
            if (listView.SelectedItems.Count > 0)
            {
                SupermarketCheckoutList item = (SupermarketCheckoutList)listView.SelectedItems[0];
                _viewModel.CloseSupermarketCheckout(item.Id);
                _viewModel.Load();
            }
            else
            {
                MessageBox.Show("Debe seleccionar una caja", "Información");
            }            
        }

        private void AddClient_Click(object sender, RoutedEventArgs e)
        {
            if (listView.Items.Count > 0)
            {
                _viewModel.AddClient();
                _viewModel.Load();
            }
            else
            {
                MessageBox.Show("Debe agregar una caja abierta", "Información");
            }
        }

        private void ServeClient_Click(object sender, RoutedEventArgs e)
        {
            if (listView.SelectedItems.Count > 0)
            {
                SupermarketCheckoutList item = (SupermarketCheckoutList)listView.SelectedItems[0];

                if(item.ClientsToAttend == 0)
                {
                    MessageBox.Show("La caja no tiene clientes por atender", "Información");
                    return;
                }
                _viewModel.ServeClient(item.Id);
                _viewModel.Load();
            }
            else
            {
                MessageBox.Show("Debe seleccionar una caja", "Información");
            }
        }
    }
}
