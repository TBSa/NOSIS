using System;
using System.Collections.ObjectModel;
using LineaSupermercado.Model;
using LineaSupermercado.UI.Data;

namespace LineaSupermercado.UI.ViewModel
{
    public class MainViewModel
    {
        public ObservableCollection<SupermarketCheckoutList> SupermarketCheckoutList { get; set; }
        private ILineaSupermercadoDataService _dataService;

        public MainViewModel(ILineaSupermercadoDataService dataService)
        {
            SupermarketCheckoutList = new ObservableCollection<SupermarketCheckoutList>();
            _dataService = dataService;
        }

        public void Load()
        {
            var data = _dataService.GetAll();
            SupermarketCheckoutList.Clear();
            foreach (var item in data)
            {
                SupermarketCheckoutList.Add(item);
            }            
        }
        
        public void AddSupermarketChekout()
        {
            _dataService.AddSupermarketChekout();
        }

        public void CloseSupermarketCheckout(int id)
        {
            _dataService.CloseSupermarketCheckout(id);
        }

        public void AddClient()
        {
            _dataService.AddClient();
        }

        public void ServeClient(int id)
        {
            _dataService.ServeClient(id);
        }
    }
}
