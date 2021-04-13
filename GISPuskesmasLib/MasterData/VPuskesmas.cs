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
    public sealed class VPuskesmas : BisnisObjek<GISPuskesmasDataClassesDataContext, V_Puskesma>
    {
        public override void OnInserting(V_Puskesma Entity)
        {

        }

        public override void Update(V_Puskesma Entity)
        {
            try
            {
                var obj = new TPuskesmas();
                var ent = new Puskesma();

                ent.IdPuskesmas = Entity.IdPuskesmas;
                ent.IdKecamatan = Entity.IdKecamatan;
                ent.NamaPuskesmas = Entity.NamaPuskesmas;
                ent.KodePuskesmas = Entity.KodePuskesmas;
                ent.Alamat = Entity.Alamat;
                ent.JenisPuskesmas = Entity.JenisPuskesmas;
                ent.Latitude = Entity.latitude;
                ent.Longitude = Entity.longitude;
                ent.Keterangan = Entity.keterangan;

                obj.Update(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Delete(V_Puskesma Entity)
        {
            try
            {
                var obj = new TPuskesmas();
                var ent = new Puskesma();

                ent.IdPuskesmas = Entity.IdPuskesmas;
                obj.Delete(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void Insert(V_Puskesma Entity)
        {
            try
            {
                var obj = new TPuskesmas();
                var ent = new Puskesma();

                ent.IdPuskesmas = Entity.IdPuskesmas;
                ent.IdKecamatan = Entity.IdKecamatan;
                ent.NamaPuskesmas = Entity.NamaPuskesmas;
                ent.KodePuskesmas = Entity.KodePuskesmas;
                ent.Alamat = Entity.Alamat;
                ent.JenisPuskesmas = Entity.JenisPuskesmas;
                ent.Latitude = Entity.latitude;
                ent.Longitude = Entity.longitude;
                ent.Keterangan = Entity.keterangan;

                obj.Insert(ent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<V_Puskesma> GetAllData()
        {
            var list = new List<V_Puskesma>();
            var query = DataContext.V_Puskesmas.OrderBy(x => x.KodePuskesmas).ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public V_Puskesma GetDataById(int pussId)
        {
            var list = new V_Puskesma();
            var query = DataContext.V_Puskesmas.FirstOrDefault(x => x.IdPuskesmas == pussId);
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public List<V_Puskesma> GetDataByKecId(int kecId)
        {
            var list = new List<V_Puskesma>();
            var query = DataContext.V_Puskesmas.Where(x => x.IdKecamatan == kecId).ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public List<V_Puskesmas_Detail> GetPusekesmasDetailByPusId(int pusId)
        {
            var list = new List<V_Puskesmas_Detail>();
            var query = DataContext.V_Puskesmas_Details.Where(x => x.IdPuskesmas == pusId).ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public List<V_Puskesma> GetKecByName(string str)
        {
            var list = new List<V_Puskesma>();
            var query = DataContext.V_Puskesmas.Where(x => x.NamaKecamatan.Contains(str) || x.NamaPuskesmas.Contains(str)).ToList();
            if (query != null)
            {
                list = query;
            }
            return list;
        }

        public List<V_Puskesmas_Detail> GetPusekesmasDetailByLatLng(double lat, double lng)
        {
            var list = new List<V_Puskesmas_Detail>();
            try
            {
                var query = DataContext.V_Puskesmas.SingleOrDefault(x => x.latitude == (decimal)lat && x.longitude == (decimal)lng).IdPuskesmas;
                if (query != null)
                {
                    var query2 = DataContext.V_Puskesmas_Details.Where(x => x.IdPuskesmas == query).ToList();
                    if (query2 != null)
                    {
                        list = query2;
                    }
                }
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
