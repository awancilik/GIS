using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GISPuskesmasData;

namespace GISPuskesmasLib
{
    [Serializable]
    public sealed class TKategori : BisnisObjek<GISPuskesmasDataClassesDataContext, Kategori>
    {
        public override void OnInserting(Kategori Entity)
        {
            //throw new NotImplementedException();
        }

        public override void Update(Kategori Entity)
        {
            var query = DataContext.Kategoris.FirstOrDefault(x => x.KategoriID == Entity.KategoriID);
            if (query != null)
            {
                query.KategoriID = Entity.KategoriID;
                query.NamaKategori = Entity.NamaKategori;

                DataContext.SubmitChanges();
            }
        }

        public override void Delete(Kategori Entity)
        {
            var query = DataContext.Kategoris.FirstOrDefault(x => x.KategoriID == Entity.KategoriID);
            if (query != null)
            {
                DataContext.Kategoris.DeleteOnSubmit(query);
                DataContext.SubmitChanges();
            }
        }

        public IList<Kategori> GetAllData()
        {
            var list = new List<Kategori>();
            var query = DataContext.Kategoris.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
