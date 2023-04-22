using Microsoft.AspNetCore.Mvc;
using ShopBanMyPham.Models;
using X.PagedList;

namespace ShopBanMyPham.Controllers
{
    public class ProductController : Controller
    {
        ShopBanMyPhamContext _context = null;

        public ProductController()
        {
            _context = new ShopBanMyPhamContext();
        }
        public IActionResult ProductByCategory(int? page, int id)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var products = _context.Products.Where(x => x.CategoryId == id).ToList();
            PagedList<Product> res = new PagedList<Product>(products, pageNumber, pageSize);
            ViewBag.Category = _context.Categories.ToList();
            ViewBag.CategorySearch = id;
            return View(res);
        }

        public IActionResult ProductDetail(int id) 
        {
            var product = _context.Products.FirstOrDefault(x => x.ProductId== id);
            ViewBag.ListFavAlso = _context.Products.Where(x => x.CategoryId == product.CategoryId && x.ProductId != product.ProductId).ToList();
            return View(product);
        }

        public IActionResult Search(int? page, string searchString)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var products = _context.Products.Where(x => x.ProductName.Contains(searchString)).ToList();
            PagedList<Product> res = new PagedList<Product>(products, pageNumber, pageSize);
            ViewBag.SearchString = searchString;
            ViewBag.Category = _context.Categories.ToList();
            return View(res);
        }
    }
}
