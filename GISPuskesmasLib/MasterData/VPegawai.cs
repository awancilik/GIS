using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GISPuskesmasData;

namespace GISPuskesmasLib.MasterData
{
    [Serializable]
    public sealed class VPegawai : BisnisObjek<GISPuskesmasDataClassesDataContext,V_Pegawai>
    {

        public override void OnInserting(V_Pegawai Entity)
        {
            //throw new NotImplementedException();
        }

        public override void Update(V_Pegawai Entity)
        {
            try
            {
                var obj = new TPegawai();
                var ent = new Pegawai();

                ent.IdPegawai = Entity.IdPegawai;
                ent.JenisPegawai = Entity.JenisPegawai;
                ent.Keterangan = Entity.Keterangan;

                obj.Update(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Delete(V_Pegawai Entity)
        {
            try
            {
                var obj = new TPegawai();
                var ent = new Pegawai();

                ent.IdPegawai = Entity.IdPegawai;
                obj.Delete(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Insert(V_Pegawai Entity)
        {
            try
            {
                var obj = new TPegawai();
                var ent = new Pegawai();

                ent.JenisPegawai = Entity.JenisPegawai;
                ent.Keterangan = Entity.Keterangan;

                obj.Insert(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<V_Pegawai> GetAllData()
        {
            var list = new List<V_Pegawai>();
            var query = DataContext.V_Pegawais.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
