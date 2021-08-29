using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ephata.User.DomainLayer.Model.User.Command
{
    public class GetResetPasswordUserCommand : IRequest<string>
    {
        public string Username { get; set; }
        public string Email { get; set; }
    }
}
