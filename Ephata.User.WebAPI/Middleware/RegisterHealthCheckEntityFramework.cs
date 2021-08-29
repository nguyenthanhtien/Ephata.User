using Ephata.User.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ephata.User.WebAPI.Middleware
{
    public static class RegisterHealthCheckEntityFramework
    {
        public static void HealthCheckEntityFramework(this IServiceCollection services)
        {
            services.AddHealthChecks()
    .                AddDbContextCheck<UserDbContext>();
        }

        public static void UseHealthCheckEntityFramework(this IApplicationBuilder app)
        {
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHealthChecks("/health");
            });
        }
    }
}
