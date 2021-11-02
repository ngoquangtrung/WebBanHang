package PRJ321x_A4.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping(value = {"home/trangchu.html" }, method = RequestMethod.GET)
	public ModelAndView Index() {

		ModelAndView mv = new ModelAndView("user/home");
		// mv.setViewName("user/home");

		return mv;
	}
}
