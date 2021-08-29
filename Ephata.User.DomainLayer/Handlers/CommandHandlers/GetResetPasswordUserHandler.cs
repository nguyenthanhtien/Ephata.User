using Ephata.User.Data.Models.User;
using Ephata.User.DomainLayer.Model.User.Command;
using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Ephata.User.DomainLayer.Handlers.CommandHandlers
{
    public class GetResetPasswordUserHandler : IRequestHandler<GetResetPasswordUserCommand, string>
    {
        private readonly UserManager<ApplicationUser> _userManager;
        public GetResetPasswordUserHandler()
        {
        }

        public async Task<string> Handle(GetResetPasswordUserCommand request, CancellationToken cancellationToken)
        {
            var userExisted = await _userManager.FindByEmailAsync(request.Email);
            if(userExisted == null)
            {
                throw new Exception("User is not existed!");
            }
            var verifyCode = await _userManager.GeneratePasswordResetTokenAsync(userExisted);
            return verifyCode;
        }
    }
}
