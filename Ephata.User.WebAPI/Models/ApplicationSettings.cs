using NetEscapades.Configuration.Validation;
using System.ComponentModel.DataAnnotations;

namespace Ephata.User.WebAPI.Models
{
    public class ApplicationSettings : IValidatable
    {
        public string ConnectionsString { get; set; }
        public string ApplicationUrl { get; set; }
        public SwaggerSetting Swagger { get; set; }

        public void Validate()
        {
            Validator.ValidateObject(this, new ValidationContext(this), true);
        }
    }
}
