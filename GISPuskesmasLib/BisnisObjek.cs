using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GISPuskesmasLib
{
    public abstract class BisnisObjek<ContextType, EntityType>
        where ContextType : DataContext, new()
        where EntityType : class
    {
        private ContextType _context = null;

        public BisnisObjek()
        {
            //
            // TODO: Add constructor logic here
            //
        }


        public ContextType DataContext
        {
            get
            {
                if (_context == null)
                {
                    _context = new ContextType();
                }
                return _context;
            }
        }

        public abstract void OnInserting(EntityType Entity);

        public virtual void Insert(EntityType Entity)
        {
            try
            {
                OnInserting(Entity);

                DataContext.GetTable<EntityType>().InsertOnSubmit(Entity);
                DataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public abstract void Update(EntityType Entity);

        public abstract void Delete(EntityType Entity);
    }
}
