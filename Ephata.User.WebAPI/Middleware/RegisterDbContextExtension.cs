using Ephata.User.Data;
using Ephata.User.Data.Models.User;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace Ephata.User.WebAPI.Middleware
{
    public static class RegisterDbContextExtension
    {       
        public static void RegisterDbContext(this IServiceCollection services, string connectionString)
        {
            services.AddDbContext<UserDbContext>(options =>
                                                   options.UseNpgsql(connectionString));

            services.AddIdentity<ApplicationUser, ApplicationRole>()
                    .AddEntityFrameworkStores<UserDbContext>()
                    .AddDefaultTokenProviders();

            //var serviceProvider = services.BuildServiceProvider();
            //var context = serviceProvider.GetService<UserDbContext>();
            //var isCreated = context.Database.EnsureCreated();
            //if (!isCreated)
            //{
            //    context.Database.Migrate();
            //}
        }
    }
}
