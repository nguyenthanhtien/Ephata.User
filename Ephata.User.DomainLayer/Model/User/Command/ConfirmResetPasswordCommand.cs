using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ephata.User.DomainLayer.Model.User.Command
{
    public class ConfirmResetPasswordCommand : IRequest<bool>
    {
        public string Email { get; set; }
        public string Token { get; set; }
        public string NewPassword { get; set; }

    }
}
