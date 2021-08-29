using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Ephata.User.DomainLayer.Exceptions;

namespace Ephata.User.WebAPI.Middleware
{
    public static class HandleExceptionFilter
    {
        public static void ConfigExceptionHandler(this IApplicationBuilder app, ILogger logger)
        {
            app.UseExceptionHandler(appError => 
            {
                appError.Run(async context => { await HandleException(logger, context); });
            });
        }

        private static async Task HandleException(ILogger logger, HttpContext context)
        {
            context.Response.StatusCode = 500;
            context.Response.ContentType = "application/json";

            var errorId = Guid.NewGuid();
            var contextFutureException = context.Features.Get<IExceptionHandlerFeature>();
            if(contextFutureException != null)
            {
                logger.LogError($"ErrorId: {errorId}, Exception: {contextFutureException.Error}");
                string errorMessage;
                string errorCode;
                if(contextFutureException.Error is UserFriendlyException)
                {

                }
            }
        }
    }
}
