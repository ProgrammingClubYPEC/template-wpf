using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace template_wpf.db
{
    internal class Instance
    {
        private static Entities entities;

        public static Entities GetContext()
        {
            if (entities == null)
                entities = new Entities();
            return entities;
        }

        public static bool loginValidated(login login)
        {
            return !string.IsNullOrEmpty(login.login1) && !string.IsNullOrEmpty(login.password);
        }

    }
}
