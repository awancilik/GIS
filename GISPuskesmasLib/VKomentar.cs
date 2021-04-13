using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GISPuskesmasData;
using GISPuskesmasLib;

namespace GISPuskesmasLib
{
    [Serializable]
    public sealed class VKomentar : BisnisObjek<GISPuskesmasDataClassesDataContext, V_Komentar>
    {
        public override void OnInserting(V_Komentar Entity)
        {
            //throw new NotImplementedException();
        }

        public override void Update(V_Komentar Entity)
        {
            try
            {
                var obj = new TKomentar();
                var ent = new Komentar();

                ent.KomentarID = Entity.KomentarID;
                ent.BeritaID = Entity.BeritaID;
                ent.Email = Entity.Email;
                ent.PostDate = DateTime.Today;
                ent.Nama = Entity.Nama;
                ent.IsiKomentar = Entity.IsiKomentar;

                obj.Update(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Delete(V_Komentar Entity)
        {
            try
            {
                var obj = new TKomentar();
                var ent = new Komentar();

                ent.KomentarID = Entity.KomentarID;
                obj.Delete(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Insert(V_Komentar Entity)
        {
            try
            {
                var obj = new TKomentar();
                var ent = new Komentar();

                ent.KomentarID = Entity.KomentarID;
                ent.BeritaID = Entity.BeritaID;
                ent.Nama = Entity.Nama;
                ent.Email = Entity.Email;
                ent.PostDate = DateTime.Today;
                ent.IsiKomentar = Entity.IsiKomentar;

                obj.Insert(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<V_Komentar> GetAllData()
        {
            var list = new List<V_Komentar>();
            var query = DataContext.V_Komentars.OrderBy(x => x.Nama).ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public IList<V_Komentar> GetKomentarByNewsId(int newsId)
        {
            var list = new List<V_Komentar>();
            var query = DataContext.V_Komentars.Where(x => x.BeritaID == newsId).ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
