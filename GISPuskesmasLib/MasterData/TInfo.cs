using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GISPuskesmasData;

namespace GISPuskesmasLib.MasterData
{
    [Serializable]
    public sealed class TInfo : BisnisObjek<GISPuskesmasDataClassesDataContext, Info>
    {
        public override void OnInserting(Info Entity)
        {
            //throw new NotImplementedException();
        }

        public override void Update(Info Entity)
        {
            var query = DataContext.Infos.FirstOrDefault(x => x.InfoID == Entity.InfoID);
            if (query != null)
            {
                query.IdPuskesmas = Entity.IdPuskesmas;
                query.InfoIsi = Entity.InfoIsi;
                query.InfoJudul = Entity.InfoJudul;
                query.InfoPostDate = DateTime.Today;

                DataContext.SubmitChanges();
            }
        }

        public override void Delete(Info Entity)
        {
            var query = DataContext.Infos.FirstOrDefault(x => x.InfoID == Entity.InfoID);
            if (query != null)
            {
                DataContext.Infos.DeleteOnSubmit(query);
                DataContext.SubmitChanges();
            }
        }


        public IList<Info> GetAllData()
        {
            var list = new List<Info>();
            var query = DataContext.Infos.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }
    }
}
