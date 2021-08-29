using Ephata.User.Data.Models.User;
using Ephata.User.DomainLayer.Command;
using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Ephata.User.DomainLayer.Handlers.CommandHandlers
{
    public class CreateUserHandler : IRequestHandler<CreateUserCommand, bool>
    {
        private readonly UserManager<ApplicationUser> _userManager;
        public CreateUserHandler(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }
        public async Task<bool> Handle(CreateUserCommand request, CancellationToken cancellationToken)
        {
            if(request == null)
            {
                throw new Exception("Request is not valid!");
            }
            var userCreateModel = new ApplicationUser 
            { 
                UserName = request.UserName,
                FirstName = request.FirstName,
                LastName = request.LastName,
                Address = request.Address,
                Email = request.Email,
                AdditionalEmail = request.AdditionalEmail,
            };

            var result = await _userManager.CreateAsync(userCreateModel, request.Password);
            if(result != null)
            {
                return result.Succeeded;
            }
            return false;
        }
    }
}
