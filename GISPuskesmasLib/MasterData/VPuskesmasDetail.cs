using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GISPuskesmasData;
using GISPuskesmasLib;

namespace GISPuskesmasLib.MasterData
{
     [Serializable]
    public sealed class VPuskesmasDetail : BisnisObjek<GISPuskesmasDataClassesDataContext, V_Puskesmas_Detail>
    {
        public override void OnInserting(V_Puskesmas_Detail Entity)
        {
            //throw new NotImplementedException();
        }

        public override void Update(V_Puskesmas_Detail Entity)
        {
            try
            {
                var obj = new TPuskesmasDetail();
                var ent = new PuskesmasDetail();

                ent.IdPuskesmasDetail = Entity.IdPuskesmasDetail;
                ent.IdPuskesmas = Entity.IdPuskesmas;
                ent.IdPegawai = Entity.IdPegawai;
                ent.Jumlah = Entity.Jumlah;
                ent.Keterangan = Entity.Keterangan;

                obj.Update(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Delete(V_Puskesmas_Detail Entity)
        {
            try
            {
                var obj = new TPuskesmasDetail();
                var ent = new PuskesmasDetail();

                ent.IdPuskesmasDetail = Entity.IdPuskesmasDetail;
                obj.Delete(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Insert(V_Puskesmas_Detail Entity)
        {
            try
            {
                var obj = new TPuskesmasDetail();
                var ent = new PuskesmasDetail();

                ent.IdPuskesmas = Entity.IdPuskesmas;
                ent.IdPegawai = Entity.IdPegawai;
                ent.Jumlah = Entity.Jumlah;
                ent.Keterangan = Entity.Keterangan;

                obj.Insert(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<V_Puskesmas_Detail> GetAllData()
        {
            var list = new List<V_Puskesmas_Detail>();
            var query = DataContext.V_Puskesmas_Details.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public IList<V_Puskesmas_Detail> GetDataByIdPuskesmas(int IdPus)
        {
            var list = new List<V_Puskesmas_Detail>();
            var query = DataContext.V_Puskesmas_Details.Where(x => x.IdPuskesmas == IdPus).ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
