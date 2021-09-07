using Ephata.User.Data.Models.User;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.IO;

namespace Ephata.User.Data
{
    public class UserDbContext : IdentityDbContext<ApplicationUser, ApplicationRole,Guid>
    {
        public UserDbContext(DbContextOptions<UserDbContext> options)
           : base(options)
        {
            //Database.Migrate();
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var configuration = new ConfigurationBuilder()
                   .SetBasePath(Directory.GetCurrentDirectory())
                   .AddJsonFile("appsettings.Development.json")
                   .Build();
                var connectionString = configuration["connectionsString"];
                //Database.Migrate();
                optionsBuilder.UseNpgsql(connectionString);
            }
        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
    }
}
