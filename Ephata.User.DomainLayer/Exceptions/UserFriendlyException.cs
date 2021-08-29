using System;


namespace Ephata.User.DomainLayer.Exceptions
{
    public class UserFriendlyException : Exception
    {
        public UserFriendlyException(string message, Exception? innerException) : base(message, innerException)
        {
        }
    }
}
