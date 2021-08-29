using Ephata.User.DomainLayer.Command;
using Ephata.User.DomainLayer.Model.User.Command;
using Ephata.User.DomainLayer.Model.User.Query;
using Ephata.User.DomainLayer.Model.User.ViewModel;
using Ephata.User.Service.Service;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Ephata.User.WebAPI.Controllers
{
    [ApiController]
    [Route("User")]
    public class UserController : ControllerBase
    {

        private readonly IUserService _userService;
        public UserController(IUserService userService)
        {
            this._userService = userService;
        }

        [HttpPost("find-users")]
        public async Task<ActionResult<IEnumerable<UserViewModel>>> FindUsers(FindUserWithConditionQuery query)
        {
            var result = await _userService.FindUsers(query);
            if(result == null)
            {
                return NoContent();
            }
            return Ok(result);
        }

        [HttpPost("create-user")]
        public async Task<ActionResult<IEnumerable<UserViewModel>>> CreateUser(CreateUserCommand command)
        {
            var result = await _userService.CreateUser(command);          
            return Ok(result);
        }

        [HttpGet("find-user/{username}")]
        public async Task<ActionResult<UserViewModel>> FinUserById(string username)
        {
            var result = await _userService.FindUserById(new FindUserByIdQuery(username));
            if (result == null)
            {
                return NoContent();
            }
            return Ok(result);
        }
        
        [HttpPost("reset-password")]
        public async Task<ActionResult<string>> GetResetPassword(GetResetPasswordUserCommand command)
        {
            var token = await _userService.GetResetPasswordToken(command);
            return Ok(token);
        }

        [HttpPost("confirm-reset-password")]
        public async Task<ActionResult<bool>> ConfirmResetPassword(ConfirmResetPasswordCommand command)
        {
            var result = await _userService.ConfirmResetPassword(command);
            return Ok(result);
        }
    }
}
