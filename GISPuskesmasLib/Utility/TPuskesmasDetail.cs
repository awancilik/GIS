using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GISPuskesmasData;

namespace GISPuskesmasLib.Utility
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
                query.IdPuskesmas = Entity.IdPuskesmas;
                query.IdPegawai = Entity.IdPegawai;
                query.Keterangan = Entity.Keterangan;
                query.DibaruiTanggal = DateTime.Today;
                query.DibaruiOleh = "ADMIN";

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
