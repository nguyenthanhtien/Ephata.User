using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using System.Collections.Generic;

namespace Ephata.User.WebAPI.Middleware
{
    public static class RegisterSwaggerExtension
    {
        public static void RegisterSwagger(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
                    c.SwaggerDoc("v1",
                                new OpenApiInfo 
                                { 
                                    Title = "User Service",
                                    Version = "Version 1"
                                }
                                ));
        }
        public static void UseSwashbuckleSwagger(this IApplicationBuilder app)
        {
            app.UseSwagger(c =>
            {
                c.RouteTemplate = $"swagger/swagger.json";
                c.PreSerializeFilters.Add((swaggerDoc, httpReq) =>
                {
                    swaggerDoc.Servers = new List<OpenApiServer>
                    {
                        new OpenApiServer
                        {
                            Url = "/users",
                        }
                    };
                });

            });
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("v1/swagger.json", "User Service Management API V1");
            });
        }
    }
}
