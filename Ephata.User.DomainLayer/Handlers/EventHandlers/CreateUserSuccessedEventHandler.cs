using Ephata.User.DomainLayer.Model.User.Event;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Ephata.User.DomainLayer.Handlers.EventHandlers
{
    public class CreateUserSuccessedEventHandler : INotificationHandler<CreatedUserSuccessEvent>
    {
        public CreateUserSuccessedEventHandler()
        {

        }

        public Task Handle(CreatedUserSuccessEvent notification, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
