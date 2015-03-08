package by.epam.tutorial.controller;

import by.epam.tutorial.model.entities.User;
import by.epam.tutorial.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserService userService;

    @ModelAttribute("user")
    public User constructUser() {
        return new User();
    }

    @RequestMapping
    public String showRegistrationForm(Model model) {
        return "register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String register(@Valid @ModelAttribute("user") User user, BindingResult result,
                           RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "register";
        }
        userService.save(user);
        redirectAttributes.addFlashAttribute("success", true);
        return "redirect:/register.html?success=true";
    }

    @RequestMapping("/available")
    @ResponseBody
    public String available(@RequestParam String username) {
        Boolean available = userService.findByName(username) == null;
        return available.toString();

    }
}
