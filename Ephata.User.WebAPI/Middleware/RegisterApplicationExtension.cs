using Ephata.User.DomainLayer.Command;
using Ephata.User.DomainLayer.Handlers.CommandHandlers;
using Ephata.User.DomainLayer.Handlers.EventHandlers;
using Ephata.User.DomainLayer.Model.User.Event;
using Ephata.User.DomainLayer.Model.User.Query;
using Ephata.User.DomainLayer.Model.User.ViewModel;
using Ephata.User.Service.Service;
using Ephata.User.WebAPI.Models;
using MediatR;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Ephata.User.DomainLayer.Handlers.QueryHandlers;

namespace Ephata.User.WebAPI.Middleware
{
    public static class RegisterApplicationExtension
    {
        public static void SetApplicationSetting(this IServiceCollection services, IConfiguration configuration, out ApplicationSettings settings)
        {
            services.UseConfigurationValidation();
            services.ConfigureValidatableSetting<ApplicationSettings>(configuration);
            var serviceProvider = services.BuildServiceProvider();
            var environmentsettings = serviceProvider.GetService<ApplicationSettings>();
            settings = environmentsettings;
        }
        public static void RegisterServiceBusiness(this IServiceCollection services)
        {
            services.AddLogging(logBuilder => logBuilder.AddConsole());
            services.AddScoped<IUserService, UserService>();
        }
        public static void RegisterHandler(this IServiceCollection services)
        {
            services.AddScoped<INotificationHandler<CreatedUserSuccessEvent>, CreateUserSuccessedEventHandler>();
            services.AddScoped<IRequestHandler<CreateUserCommand, bool>, CreateUserHandler>();
            services.AddScoped<IRequestHandler<FindUserByIdQuery, UserViewModel>, FindUserByIdQueryHandler>();
        }
    }
}
