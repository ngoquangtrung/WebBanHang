package PRJ321x_A4.Controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import PRJ321x_A4.Entity.*;
@Controller
public class AccountController extends BaseController{
	//ModelAndView mv;
	@RequestMapping(value = {"/login.html","/"}, method = RequestMethod.GET)
	public ModelAndView Account() {
		//ModelAndView mv=new ModelAndView("user/login");
		_mvShare.setViewName("user/login");
		_mvShare.addObject("account",_accImpl.getAcc());
		_mvShare.addObject("accountUser", new Account());
		return _mvShare;
	}
	
	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public ModelAndView Login(@ModelAttribute("accountUser") Account acc) {
		boolean check=_accImpl.checkAccount(acc);
		if(check) {
			//_mvShare.setViewName("user/home");
			_mvShare.setViewName("redirect:home/trangchu.html");
			_mvShare.addObject("status","Success");
		}else {
			//_mvShare.setViewName("redirect:login");
			//_mvShare.setViewName("redirect:login.html");
			_mvShare.setViewName("user/login");
			_mvShare.addObject("status","Some thing wrong!");
		}
		
		return _mvShare;
	}
	
}
