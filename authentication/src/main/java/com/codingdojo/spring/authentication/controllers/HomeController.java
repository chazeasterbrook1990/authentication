package com.codingdojo.spring.authentication.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.spring.authentication.models.LoginUser;
import com.codingdojo.spring.authentication.models.User;
import com.codingdojo.spring.authentication.respositories.UserRepository;
import com.codingdojo.spring.authentication.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {
 
 @Autowired
 public UserService userService;
 
 @Autowired
 public UserRepository userRepo;
 
 @GetMapping("/")
 public String index(Model model) {
     model.addAttribute("newUser", new User());
     model.addAttribute("newLogin", new LoginUser());
     return "registrationform.jsp";
 }
 
 @GetMapping("/register")
 public String registerComplete() {
	 return "registered.jsp";
 }
 
 @GetMapping("/dashboard")
 public String dashboard(Model model, @ModelAttribute("userLoggedIn") User newUser, HttpSession session) {
	 Long id = (Long) session.getAttribute("loggedInUser");
	 User userLoggedIn = userRepo.findById(id).get();
	 model.addAttribute("userLoggedIn", userLoggedIn);
	 return "dashboard.jsp";
 }
 
 @GetMapping("/logout")
 public String logout(HttpSession session) {
	 session.setAttribute("loggedInUser", null);
	 return "redirect:/";
 }
 
 @PostMapping("/register")
 public String register(@Valid @ModelAttribute("newUser") User newUser, 
         BindingResult result, Model model, HttpSession session) {
     
     if(result.hasErrors() || userService.register(newUser, result)!=newUser) {
         model.addAttribute("newLogin", new LoginUser());
         return "registrationform.jsp";
     } else if (session.getAttribute("loggedInUser") != null){
    	 return "redirect:/dashboard";
     } else {
    	 userService.register(newUser, result);
    	 session.setAttribute("loggedInUser", newUser.getId());
     }
     
     return "redirect:/register";
 }
 
 @PostMapping("/login")
 public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
         BindingResult result, Model model, HttpSession session) {
  
	 User user = userService.login(newLogin, result);
 
     if(result.hasErrors()) {
         model.addAttribute("newUser", new User());
         return "registrationform.jsp";
     }
     
     userService.login(newLogin, result);
     session.setAttribute("loggedInUser", user.getId());
    
     return "redirect:/dashboard";
 }
 
}
