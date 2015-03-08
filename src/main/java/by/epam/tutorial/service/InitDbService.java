package by.epam.tutorial.service;

import by.epam.tutorial.model.entities.Blog;
import by.epam.tutorial.model.entities.Item;
import by.epam.tutorial.model.entities.Role;
import by.epam.tutorial.model.entities.User;
import by.epam.tutorial.repository.BlogRepository;
import by.epam.tutorial.repository.ItemRepository;
import by.epam.tutorial.repository.RoleRepository;
import by.epam.tutorial.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Transactional
@Service
public class InitDbService {

    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ItemRepository itemRepository;
    @Autowired
    private BlogRepository blogRepository;

    @PostConstruct
    public void init() {

        if (roleRepository.findByName("ROLE_ADMIN") == null) {


            Role roleUser = new Role();
            roleUser.setName("ROLE_USER");
            roleRepository.save(roleUser);

            Role roleAdmin = new Role();
            roleAdmin.setName("ROLE_ADMIN");
            roleRepository.save(roleAdmin);

            User userAdmin = new User();
            userAdmin.setEnabled(true);
            userAdmin.setName("admin");
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            userAdmin.setPassword(encoder.encode("admin"));
            List<Role> roles = new ArrayList<Role>();
            roles.add(roleAdmin);
            roles.add(roleUser);
            userAdmin.setRoles(roles);
            userRepository.save(userAdmin);

            Blog blogJavavids = new Blog();
            blogJavavids.setName("JavaVids");
            blogJavavids.setUrl("http://feeds.feedburner.com/javavids?format=xml");
            blogJavavids.setUser(userAdmin);
            blogRepository.save(blogJavavids);
        }
    }
}
