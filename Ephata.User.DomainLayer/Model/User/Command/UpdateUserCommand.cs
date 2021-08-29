using MediatR;

namespace Ephata.User.DomainLayer.Command
{
    public class UpdateUserCommand : IRequest<bool>
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string AdditionalEmail { get; set; }
    }
}
