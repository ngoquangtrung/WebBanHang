package PRJ321x_A4.Controller;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import PRJ321x_A4.Service.AccountImpl;
@Controller
public class BaseController {
	@Autowired
	AccountImpl _accImpl;
	public ModelAndView _mvShare=new ModelAndView();
	@PostConstruct
	public ModelAndView Init() {
		_mvShare.addObject("account",_accImpl.getAcc());
		return _mvShare;
	}
}
