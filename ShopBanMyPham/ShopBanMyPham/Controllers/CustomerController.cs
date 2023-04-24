using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using ShopBanMyPham.Models;
using System.Drawing;

namespace ShopBanMyPham.Controllers
{
	public class CustomerController : Controller
	{
		ShopBanMyPhamContext _context = null;

		public INotyfService _notyfService { get; }

		public CustomerController(INotyfService notyfService)
		{
			_context= new ShopBanMyPhamContext();
			_notyfService=notyfService;
		}
		public IActionResult UpdateInfo(string fullname, string address, string email, string phoneNumber)
		{
			var userName = HttpContext.Session.GetString("UserName");
            var user = _context.Users.FirstOrDefault(x => x.Username == userName);
			var customer = _context.Customers.FirstOrDefault(x => x.UserId == user.UserId);
			if(customer == null)
			{
				Customer c = new Customer();
				c.UserId = user.UserId;
				c.CustomerName = fullname;
				c.Address = address;
				c.Email= email;
				c.PhoneNumber = phoneNumber;
				_context.Customers.Add(c);
				_context.SaveChanges();
			}
			else
			{
                customer.UserId = user.UserId;
                customer.CustomerName = fullname;
                customer.Address = address;
                customer.Email = email;
                customer.PhoneNumber = phoneNumber;
				_context.SaveChanges();
            }
            _notyfService.Success("Cập nhật thông tin khách hàng thành công");
            return RedirectToAction("Payment", "Cart");
		}
	}
}
