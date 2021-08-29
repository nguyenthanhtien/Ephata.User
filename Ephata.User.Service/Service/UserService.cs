using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Ephata.User.DomainLayer.Command;
using Ephata.User.DomainLayer.Model.User.Command;
using Ephata.User.DomainLayer.Model.User.Query;
using Ephata.User.DomainLayer.Model.User.ViewModel;
using MediatR;

namespace Ephata.User.Service.Service
{
    public interface IUserService
    {
        Task<UserViewModel> FindUserById(FindUserByIdQuery query);
        Task<IEnumerable<UserViewModel>> FindUsers(FindUserWithConditionQuery query);
        Task<bool> CreateUser(CreateUserCommand command);
        Task<bool> UpdateUser(UpdateUserCommand command);
        Task<bool> DisableUser(LockoutUserCommand command);
        Task<string> GetResetPasswordToken(GetResetPasswordUserCommand command);
        Task<bool> ConfirmResetPassword(ConfirmResetPasswordCommand command);

    }

    public class UserService : IUserService
    {
        private readonly IMediator _mediator;
        public UserService(IMediator mediator)
        {
            this._mediator = mediator;
        }

        public Task<bool> ConfirmResetPassword(ConfirmResetPasswordCommand command)
        {
            return _mediator.Send(command);
        }

        public Task<bool> CreateUser(CreateUserCommand command)
        {
            return _mediator.Send(command);
        }

        public Task<bool> DisableUser(LockoutUserCommand command)
        {
            return _mediator.Send(command);
        }

        public Task<UserViewModel> FindUserById(FindUserByIdQuery query)
        {
            return _mediator.Send(query);
        }

        public Task<IEnumerable<UserViewModel>> FindUsers(FindUserWithConditionQuery query)
        {
            return _mediator.Send(query);
        }

        public Task<string> GetResetPasswordToken(GetResetPasswordUserCommand command)
        {
            return _mediator.Send(command);
        }

        public Task<bool> UpdateUser(UpdateUserCommand command)
        {
            return _mediator.Send(command);
        }
    }
}
