//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Human_Resource
{
    using System;
    using System.Collections.Generic;
    
    public partial class Images
    {
        public int ImageId { get; set; }
        public string docName { get; set; }
        public string docnum { get; set; }
        public string image { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public Nullable<int> MessageID { get; set; }
    
        public virtual employees employees { get; set; }
    }
}
