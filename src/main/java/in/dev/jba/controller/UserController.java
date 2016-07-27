package in.dev.jba.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import in.dev.jba.entity.User;
import in.dev.jba.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@RequestMapping("/users")
	public String users(Model model){
		model.addAttribute("users",userService.finaAll());
		return "users";
		
	}
	
		
	@RequestMapping("/users/{id}")
	public String details(Model model, @PathVariable int id){
		model.addAttribute("user",userService.findOneWithBlogs(id));
		return "user-detail";
	}
	
	@RequestMapping("/register")
	public String showRegistration(){
		return "user-register";
	}
	
	@ModelAttribute("user")
	public User construct(){
		return new User();
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String doRegistration(@ModelAttribute("user") User user ){
		System.out.println("User id: "+ user.getName());
		userService.save(user);
		return "redirect:/user-register?success=true";
	}
}
