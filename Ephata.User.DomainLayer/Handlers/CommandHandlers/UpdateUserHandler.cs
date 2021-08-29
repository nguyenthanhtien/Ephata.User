using Ephata.User.Data.Models.User;
using Ephata.User.DomainLayer.Command;
using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Ephata.User.DomainLayer.Handlers.CommandHandlers
{
    public class UpdateUserHandler : IRequestHandler<UpdateUserCommand, bool>
    {
        private readonly UserManager<ApplicationUser> _userManager;
        public UpdateUserHandler(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }
        public async Task<bool> Handle(UpdateUserCommand request, CancellationToken cancellationToken)
        {
            var userExisted = await _userManager.FindByNameAsync(request.UserName);
            if(userExisted == null)
            {
                throw new Exception("User is not existed!");
            }
            userExisted.Email = request.Email;
            userExisted.FirstName = request.FirstName;
            userExisted.LastName = request.LastName;
            userExisted.Address = request.Address;
            userExisted.AdditionalEmail = request.AdditionalEmail;
            userExisted.FullName = $"{request.FirstName} {request.LastName}";
            var result = await _userManager.UpdateAsync(userExisted);
            if(result != null)
            {
                return result.Succeeded;
            }
            return false;
        }
    }
}
