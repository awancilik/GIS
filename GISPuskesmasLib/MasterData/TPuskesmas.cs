using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GISPuskesmasData;

namespace GISPuskesmasLib.MasterData
{
    [Serializable]
    public sealed class TPuskesmas : BisnisObjek<GISPuskesmasDataClassesDataContext, Puskesma>
    {

        public override void OnInserting(Puskesma Entity)
        {
            Entity.DibaruiOleh = "ADMIN";
            Entity.DibaruiTanggal = DateTime.Today;
            Entity.DibuatOleh = "ADMIN";
            Entity.DibuatTanggal = DateTime.Today;
        }

        public override void Update(Puskesma Entity)
        {
            var query = DataContext.Puskesmas.FirstOrDefault(x => x.IdPuskesmas == Entity.IdPuskesmas);
            if (query != null)
            {
                query.IdKecamatan = Entity.IdKecamatan;
                query.NamaPuskesmas = Entity.NamaPuskesmas;
                query.Alamat = Entity.Alamat;
                query.KodePuskesmas = Entity.KodePuskesmas;
                query.JenisPuskesmas = Entity.JenisPuskesmas;
                query.Latitude = Entity.Latitude;
                query.Longitude = Entity.Longitude;
                query.Keterangan = Entity.Keterangan;

                DataContext.SubmitChanges();
            }
        }

        public override void Delete(Puskesma Entity)
        {
            var query = DataContext.Puskesmas.FirstOrDefault(x => x.IdPuskesmas == Entity.IdPuskesmas);
            if (query != null)
            {
                DataContext.Puskesmas.DeleteOnSubmit(query);
                DataContext.SubmitChanges();
            }
        }

        public IList<Puskesma> GetAllData()
        {
            var list = new List<Puskesma>();
            var query = DataContext.Puskesmas.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
