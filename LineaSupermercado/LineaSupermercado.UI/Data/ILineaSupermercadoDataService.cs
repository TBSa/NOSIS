using System.Collections.Generic;
using LineaSupermercado.Model;

namespace LineaSupermercado.UI.Data
{
    public interface ILineaSupermercadoDataService
    {
        IEnumerable<SupermarketCheckoutList> GetAll();

        void AddSupermarketChekout();

        void CloseSupermarketCheckout(int id);

        void AddClient();

        void ServeClient(int id);
    }
}