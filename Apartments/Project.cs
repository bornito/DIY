//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Apartments
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Project
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Project()
        {
            this.UploadedProjects = new HashSet<UploadedProject>();
        }
    
        public int IDProject { get; set; }

        [Required]
        [MaxLength(50, ErrorMessage ="{0} must be up to 50 chars")]
        public string Name { get; set; }

        [Required]
        [MaxLength(50, ErrorMessage = "{0} must be up to 50 chars")]
        public string Description { get; set; }
        public int UserIDUser { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UploadedProject> UploadedProjects { get; set; }
        public virtual User User { get; set; }
    }
}