using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GISPuskesmasData;
using GISPuskesmasLib;

namespace GISPuskesmasLib
{
    [Serializable]
    public sealed class VKategori : BisnisObjek<GISPuskesmasDataClassesDataContext, V_Kategori>
    {
        public override void OnInserting(V_Kategori Entity)
        {
            //throw new NotImplementedException();
        }

        public override void Update(V_Kategori Entity)
        {
            try
            {
                var obj = new TKategori();
                var ent = new Kategori();

                ent.KategoriID = Entity.KategoriID;
                ent.NamaKategori = Entity.NamaKategori;

                obj.Update(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Delete(V_Kategori Entity)
        {
            try
            {
                var obj = new TKategori();
                var ent = new Kategori();

                ent.KategoriID = Entity.KategoriID;
                obj.Delete(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Insert(V_Kategori Entity)
        {
            try
            {
                var obj = new TKategori();
                var ent = new Kategori();

                ent.KategoriID = Entity.KategoriID;
                ent.NamaKategori = Entity.NamaKategori;

                obj.Insert(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<V_Kategori> GetAllData()
        {
            var list = new List<V_Kategori>();
            var query = DataContext.V_Kategoris.OrderBy(x => x.NamaKategori).ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
