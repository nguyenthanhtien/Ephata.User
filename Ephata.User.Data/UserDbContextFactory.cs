using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace Ephata.User.Data
{
    class UserDbContextFactory : IDesignTimeDbContextFactory<UserDbContext>
    {
        public UserDbContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<UserDbContext>();
            //optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=Ephata;Integrated Security=SSPI;");
            
            return new UserDbContext(optionsBuilder.Options);
        }
    }
}
