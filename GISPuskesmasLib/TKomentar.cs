using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GISPuskesmasData;

namespace GISPuskesmasLib
{
    [Serializable]
    public sealed class TKomentar : BisnisObjek<GISPuskesmasDataClassesDataContext, Komentar>
    {
        public override void OnInserting(Komentar Entity)
        {
            //throw new NotImplementedException();
        }

        public override void Update(Komentar Entity)
        {
            var query = DataContext.Komentars.FirstOrDefault(x => x.KomentarID == Entity.KomentarID);
            if (query != null)
            {
                query.Email = Entity.Email;
                query.IsiKomentar = Entity.IsiKomentar;
                query.PostDate = DateTime.Today;
                query.Nama = Entity.Nama;
                query.BeritaID = Entity.BeritaID;

                DataContext.SubmitChanges();
            }
        }

        public override void Delete(Komentar Entity)
        {
            var query = DataContext.Komentars.FirstOrDefault(x => x.KomentarID == Entity.KomentarID);
            if (query != null)
            {
                DataContext.Komentars.DeleteOnSubmit(query);
                DataContext.SubmitChanges();
            }
        }

        public IList<Komentar> GetAllData()
        {
            var list = new List<Komentar>();
            var query = DataContext.Komentars.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
