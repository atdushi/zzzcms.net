using System.Web.Mvc;

namespace Controllers.Models
{
    public class MobileCapableRazorViewEngine : RazorViewEngine
    {
        public override ViewEngineResult FindView(ControllerContext controllerContext, string viewName, string masterName, bool useCache)
        {
            ViewEngineResult result = null;
            var request = controllerContext.HttpContext.Request;
#if DEBUG
            result = base.FindView(controllerContext, "Mobile/" + viewName, masterName, useCache);
#else
            // Avoid unnecessary checks if this device isn't suspected to be a mobile device
            if (request.Browser.IsMobileDevice)
            {
                result = base.FindView(controllerContext, "Mobile/" + viewName, masterName, useCache);
            }
#endif
            //Fall back to desktop view if no other view has been selected
            if (result == null || result.View == null)
            {
                result = base.FindView(controllerContext, viewName, masterName, useCache);
            }

            return result;
        }
    }
}
