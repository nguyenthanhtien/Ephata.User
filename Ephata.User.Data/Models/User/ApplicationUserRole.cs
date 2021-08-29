using Microsoft.AspNetCore.Identity;
using System;

namespace Ephata.User.Data.Models.User
{
    public class ApplicationUserRole : IdentityUserRole<Guid>
    {
        public virtual ApplicationUser User { get; set; }
        public virtual ApplicationRole Role { get; set; }
    }
}