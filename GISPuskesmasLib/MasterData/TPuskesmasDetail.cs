using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GISPuskesmasData;

namespace GISPuskesmasLib.MasterData
{
    [Serializable]
    public sealed class TPuskesmasDetail : BisnisObjek<GISPuskesmasDataClassesDataContext, PuskesmasDetail>
    {

        public override void OnInserting(PuskesmasDetail Entity)
        {
            Entity.DibaruiOleh = "ADMIN";
            Entity.DibaruiTanggal = DateTime.Today;
            Entity.DibuatOleh = "ADMIN";
            Entity.DibuatTanggal = DateTime.Today;
        }

        public override void Update(PuskesmasDetail Entity)
        {
            var query = DataContext.PuskesmasDetails.FirstOrDefault(x => x.IdPuskesmasDetail == Entity.IdPuskesmasDetail);
            if (query != null)
            {
                query.IdPegawai = Entity.IdPegawai;
                query.IdPuskesmas = Entity.IdPuskesmas;
                query.Jumlah = Entity.Jumlah;
                query.Keterangan = Entity.Keterangan;

                DataContext.SubmitChanges();
            }
        }

        public override void Delete(PuskesmasDetail Entity)
        {
            var query = DataContext.PuskesmasDetails.FirstOrDefault(x => x.IdPuskesmasDetail == Entity.IdPuskesmasDetail);
            if (query != null)
            {
                DataContext.PuskesmasDetails.DeleteOnSubmit(query);
                DataContext.SubmitChanges();
            }
        }

        public IList<PuskesmasDetail> GetAllData()
        {
            var list = new List<PuskesmasDetail>();
            var query = DataContext.PuskesmasDetails.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
