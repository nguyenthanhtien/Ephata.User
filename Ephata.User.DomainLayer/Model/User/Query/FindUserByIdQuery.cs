using Ephata.User.DomainLayer.Model.User.ViewModel;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ephata.User.DomainLayer.Model.User.Query
{
    public class FindUserByIdQuery : IRequest<UserViewModel>
    {
        public FindUserByIdQuery(string username)
        {
            this.Username = username;
        }
        public string Username { get; set; }
    }
}
