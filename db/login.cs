//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace template_wpf.db
{
    using System;
    using System.Collections.Generic;
    
    public partial class login
    {
        public string login1 { get; set; }
        public string password { get; set; }
    
        public virtual user user { get; set; }
    }
}
