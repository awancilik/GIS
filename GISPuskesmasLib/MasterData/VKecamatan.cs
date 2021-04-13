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
    public sealed class VKecamatan : BisnisObjek<GISPuskesmasDataClassesDataContext, V_Kecamatan>
    {

        public override void OnInserting(V_Kecamatan Entity)
        {
            //throw new NotImplementedException();
        }

        public override void Update(V_Kecamatan Entity)
        {
            try
            {
                var obj = new TKecamatan();
                var ent = new Kecamatan();

                ent.IdKecamatan = Entity.IdKecamatan;
                ent.Nama = Entity.namakecamatan;
                ent.Keterangan = Entity.keterangan;

                obj.Update(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Delete(V_Kecamatan Entity)
        {
            try
            {
                var obj = new TKecamatan();
                var ent = new Kecamatan();

                ent.IdKecamatan = Entity.IdKecamatan;
                obj.Delete(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Insert(V_Kecamatan Entity)
        {
            try
            {
                var obj = new TKecamatan();
                var ent = new Kecamatan();

                ent.Nama = Entity.namakecamatan;
                ent.Keterangan = Entity.keterangan;

                obj.Insert(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<V_Kecamatan> GetAllData()
        {
            var list = new List<V_Kecamatan>();
            var query = DataContext.V_Kecamatans.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
