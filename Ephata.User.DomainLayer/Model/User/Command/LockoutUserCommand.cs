using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ephata.User.DomainLayer.Command
{
    public class LockoutUserCommand : IRequest<bool>
    {
        public string Username { get; set; }
        public bool IsLockout { get; set; }
        public DateTimeOffset? LockoutDate { get; set; }

    }
}
