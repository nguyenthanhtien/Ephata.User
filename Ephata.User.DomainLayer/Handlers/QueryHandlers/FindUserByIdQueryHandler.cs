using Ephata.User.Data.Models.User;
using Ephata.User.DomainLayer.Model.User.Query;
using Ephata.User.DomainLayer.Model.User.ViewModel;
using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Ephata.User.DomainLayer.Handlers.QueryHandlers
{
    public class FindUserByIdQueryHandler : IRequestHandler<FindUserByIdQuery, UserViewModel>
    {
        private readonly UserManager<ApplicationUser> _userManager;
        public FindUserByIdQueryHandler(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }
        public async Task<UserViewModel> Handle(FindUserByIdQuery request, CancellationToken cancellationToken)
        {
            var userExited = await _userManager.FindByNameAsync(request.Username);
            if (userExited == null)
            {
                throw new Exception("Can not find user by username!");
            }
            return new UserViewModel
            {
                Email = userExited.Email,
                FirstName = userExited.FirstName,
                LastName = userExited.LastName,
                UserName = userExited.UserName
            };
        }
    }
}
