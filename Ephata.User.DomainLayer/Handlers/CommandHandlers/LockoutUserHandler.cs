using Ephata.User.Data.Models.User;
using Ephata.User.DomainLayer.Command;
using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Ephata.User.DomainLayer.Handlers.CommandHandlers
{
    public class LockoutUserHandler : IRequestHandler<LockoutUserCommand, bool>
    {
        private readonly UserManager<ApplicationUser> _userManager;
        public LockoutUserHandler(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }
        public async Task<bool> Handle(LockoutUserCommand request, CancellationToken cancellationToken)
        {
            var userExisted = await _userManager.FindByNameAsync(request.Username);
            if (userExisted == null)
            {
                throw new Exception("User is not existed!");
            }
            userExisted.IsDeleted = true;
            await _userManager.SetLockoutEnabledAsync(userExisted, request.IsLockout);
            await _userManager.SetLockoutEndDateAsync(userExisted, request.LockoutDate);
            return true;
        }
    }
}
