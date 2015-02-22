package by.epam.tutorial.controller;

import by.epam.tutorial.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @Autowired
    public ItemService itemService;

    @RequestMapping("/index")
    public String index(Model model) {
        model.addAttribute("items", itemService.getItems());
        return "index";
    }

    @RequestMapping("/")
    public String home(Model model) {
        return index(model);
    }

}