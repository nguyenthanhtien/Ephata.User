using Microsoft.AspNetCore.Identity;
using System;

namespace Ephata.User.Data.Models.User
{
    public class ApplicationRole : IdentityRole<Guid>
    {
        public bool IsDeleted { get; set; }
    }
}