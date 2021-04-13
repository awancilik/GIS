using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GISPuskesmasData;
using GISPuskesmasLib;

namespace GISPuskesmasLib.MasterData
{
    [Serializable]
    public sealed class Vinfo : BisnisObjek<GISPuskesmasDataClassesDataContext, V_Info>
    {

        public override void OnInserting(V_Info Entity)
        {
            //throw new NotImplementedException();
        }

        public override void Update(V_Info Entity)
        {
            try
            {
                var obj = new TInfo();
                var ent = new Info();

                ent.InfoID = Entity.InfoID;
                ent.IdPuskesmas = Entity.IdPuskesmas;
                ent.InfoIsi = Entity.InfoIsi;
                ent.InfoJudul = Entity.InfoJudul;
                ent.InfoPostDate = Entity.InfoPostDate;

                obj.Update(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Delete(V_Info Entity)
        {
            try
            {
                var obj = new TInfo();
                var ent = new Info();

                ent.InfoID = Entity.InfoID;
                obj.Delete(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Insert(V_Info Entity)
        {
            try
            {

                var obj = new TInfo();
                var ent = new Info();

                ent.IdPuskesmas = Entity.IdPuskesmas;
                ent.InfoIsi = Entity.InfoIsi;
                ent.InfoJudul = Entity.InfoJudul;
                ent.InfoPostDate = DateTime.Today;

                obj.Insert(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<V_Info> GetAllData()
        {
            var list = new List<V_Info>();
            var query = DataContext.V_Infos.ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public V_Info GetDataByPusId(int pusId)
        {
            var list = new V_Info();
            var query = DataContext.V_Infos.SingleOrDefault(x => x.IdPuskesmas == pusId);
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public IList<V_Info> GetInfoByLatLng(double lat, double lng)
        {
            var info = new List<V_Info>();
            try
            {
                var query = DataContext.V_Puskesmas.FirstOrDefault(x => x.latitude == (decimal)lat && x.longitude == (decimal)lng).IdPuskesmas;
                if (query != null)
                {
                    var query2 = DataContext.V_Infos.Where(x => x.IdPuskesmas == query).ToList();
                    if (query2 != null)
                    {
                        info = query2;
                    }
                }
                return info;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
