using Ephata.User.DomainLayer.Model.User.ViewModel;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ephata.User.DomainLayer.Model.User.Query
{
    public class FindUserWithConditionQuery : IRequest<IEnumerable<UserViewModel>>
    {
    }
}
