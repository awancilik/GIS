using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GISPuskesmasData;
using GISPuskesmasLib;

namespace GISPuskesmasLib
{
    [Serializable]
    public sealed class VBerita : BisnisObjek<GISPuskesmasDataClassesDataContext, V_Berita>
    {
        public override void OnInserting(V_Berita Entity)
        {

        }

        public override void Update(V_Berita Entity)
        {
            try
            {
                var obj = new TBerita();
                var ent = new Berita();

                ent.BeritaID = Entity.BeritaID;
                ent.Isi = Entity.Isi;
                ent.Judul = Entity.Judul;
                ent.PostDate = DateTime.Today;
                ent.Status = Entity.Status;

                obj.Update(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Delete(V_Berita Entity)
        {
            try
            {
                var obj = new TBerita();
                var ent = new Berita();

                ent.BeritaID = Entity.BeritaID;
                obj.Delete(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Insert(V_Berita Entity)
        {
            try
            {
                var obj = new TBerita();
                var ent = new Berita();

                ent.BeritaID = Entity.BeritaID;
                //ent.KategoriID = Entity.KategoriID;
                ent.Isi = Entity.Isi;
                ent.Judul = Entity.Judul;
                ent.PostDate = DateTime.Today;
                ent.Status = Entity.Status;

                obj.Insert(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<V_Berita> GetAllData()
        {
            var list = new List<V_Berita>();
            var query = DataContext.V_Beritas.OrderBy(x => x.PostDate).ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public V_Berita GetBeritaById(int Id)
        {
            var q = new V_Berita();
            var query = DataContext.V_Beritas.FirstOrDefault(x => x.BeritaID == Id);
            if (query != null)
            {
                q = query;
            }
            return q;
        }

        public List<V_Berita> GetBeritaByIdReturnList(int Id)
        {
            var q = new List<V_Berita>();
            var query = DataContext.V_Beritas.Where(x => x.BeritaID == Id).ToList();
            if (query != null)
            {
                q = query;
            }
            return q;
        }
    }
}
