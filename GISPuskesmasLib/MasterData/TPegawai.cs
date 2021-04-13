using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GISPuskesmasData;

namespace GISPuskesmasLib.MasterData
{
    [Serializable]
    public sealed class TPegawai :  BisnisObjek<GISPuskesmasDataClassesDataContext, Pegawai>
    {

        public override void OnInserting(Pegawai Entity)
        {
            Entity.DibaruiOleh = "ADMIN";
            Entity.DibaruiTanggal = DateTime.Today;
            Entity.DibuatOleh = "ADMIN";
            Entity.DibuatTanggal = DateTime.Today;
        }

        public override void Update(Pegawai Entity)
        {
            var query = DataContext.Pegawais.FirstOrDefault(x => x.IdPegawai == Entity.IdPegawai);
            if (query != null)
            {
                query.JenisPegawai = Entity.JenisPegawai;
                query.Keterangan = Entity.Keterangan;
                query.DibaruiTanggal = DateTime.Today;
                query.DibaruiOleh = "ADMIN";

                DataContext.SubmitChanges();
            }
        }

        public override void Delete(Pegawai Entity)
        {
            var query = DataContext.Pegawais.FirstOrDefault(x => x.IdPegawai == Entity.IdPegawai);
            if (query != null)
            {
                DataContext.Pegawais.DeleteOnSubmit(query);
                DataContext.SubmitChanges();
            }
        }

        public IList<Pegawai> GetAllData()
        {
            var list = new List<Pegawai>();
            var query = DataContext.Pegawais.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
