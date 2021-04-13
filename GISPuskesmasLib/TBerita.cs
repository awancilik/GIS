using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GISPuskesmasData;

namespace GISPuskesmasLib
{
     [Serializable]
    public sealed class TBerita : BisnisObjek<GISPuskesmasDataClassesDataContext, Berita>
    {
        public override void OnInserting(Berita Entity)
        {
           //throw new NotImplementedException();
        }

        public override void Update(Berita Entity)
        {
            var query = DataContext.Beritas.FirstOrDefault(x => x.BeritaID == Entity.BeritaID);
            if (query != null)
            {
                query.Isi = Entity.Isi;
                query.Judul = Entity.Judul;
                query.PostDate = DateTime.Today;
                query.Status = Entity.Status;

                DataContext.SubmitChanges();
            }
        }

        public override void Delete(Berita Entity)
        {
            var query = DataContext.Beritas.FirstOrDefault(x => x.BeritaID == Entity.BeritaID);
            if (query != null)
            {
                DataContext.Beritas.DeleteOnSubmit(query);
                DataContext.SubmitChanges();
            }
        }

        public IList<Berita> GetAllData()
        {
            var list = new List<Berita>();
            var query = DataContext.Beritas.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
