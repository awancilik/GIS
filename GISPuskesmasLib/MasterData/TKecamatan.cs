using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GISPuskesmasData;

namespace GISPuskesmasLib.MasterData
{
    [Serializable]
    public sealed class TKecamatan : BisnisObjek<GISPuskesmasDataClassesDataContext, Kecamatan>
    {

        public override void OnInserting(Kecamatan Entity)
        {
            Entity.DibaruiOleh = "ADMIN";
            Entity.DibaruiTanggal = DateTime.Today;
            Entity.DibuatOleh = "ADMIN";
            Entity.DibuatTanggal = DateTime.Today;
        }

        public override void Update(Kecamatan Entity)
        {
            var query = DataContext.Kecamatans.FirstOrDefault(x => x.IdKecamatan == Entity.IdKecamatan);
            if (query != null)
            {
                query.Nama = Entity.Nama;
                query.Keterangan = Entity.Keterangan;
                query.DibaruiTanggal = DateTime.Today;
                query.DibaruiOleh = "ADMIN";

                DataContext.SubmitChanges();
            }
        }

        public override void Delete(Kecamatan Entity)
        {
            var query = DataContext.Kecamatans.FirstOrDefault(x => x.IdKecamatan == Entity.IdKecamatan);
            if (query != null)
            {
                DataContext.Kecamatans.DeleteOnSubmit(query);
                DataContext.SubmitChanges();
            }
        }

        public IList<Kecamatan> GetAllData()
        {
            var list = new List<Kecamatan>();
            var query = DataContext.Kecamatans.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
