using Ephata.User.Data.Models.User;
using Ephata.User.DomainLayer.Model.User.Command;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Ephata.User.DomainLayer.Handlers.CommandHandlers
{
    public class ConfirmResetPasswordUserHandler : IRequestHandler<ConfirmResetPasswordCommand, bool>
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<ConfirmResetPasswordUserHandler> _logger;

        public ConfirmResetPasswordUserHandler(
            UserManager<ApplicationUser> userManager,
            ILogger<ConfirmResetPasswordUserHandler> logger
        )

        {
            _userManager = userManager;
            _logger = logger;
        }

        public async Task<bool> Handle(ConfirmResetPasswordCommand request, CancellationToken cancellationToken)
        {
            var userExisted = await _userManager.FindByEmailAsync(request.Email);
            if (userExisted == null)
            {
                throw new Exception("User is not existed!");
            }
            var result = await _userManager.ResetPasswordAsync(userExisted, request.Token, request.NewPassword);
            if(result != null)
            {
                if (!result.Succeeded)
                {
                    _logger.LogError("Can't reset password :", result.Errors);
                    return false;
                }
                return true;
            }
            return false;
        }
    }
}
