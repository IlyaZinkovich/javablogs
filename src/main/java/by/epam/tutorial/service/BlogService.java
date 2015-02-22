package by.epam.tutorial.service;

import by.epam.tutorial.exception.RssException;
import by.epam.tutorial.model.entities.Blog;
import by.epam.tutorial.model.entities.Item;
import by.epam.tutorial.model.entities.User;
import by.epam.tutorial.repository.BlogRepository;
import by.epam.tutorial.repository.ItemRepository;
import by.epam.tutorial.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogService {

    @Autowired
    private BlogRepository blogRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private RssService rssService;

    public void saveItems(Blog blog) {
        try {
            List<Item> items = rssService.getItems(blog.getUrl());
            for (Item item : items) {
                Item savedItem = itemRepository.findByBlogAndLink(blog, item.getLink());
                if(savedItem == null) {
                    item.setBlog(blog);
                    itemRepository.save(item);
                }
            }
        } catch (RssException e) {
            e.printStackTrace();
        }
    }

    public void save(Blog blog, String name) {
        User user = userRepository.findByName(name);
        blog.setUser(user);
        blogRepository.save(blog);
        saveItems(blog);
    }

    @Scheduled(fixedDelay = 3600000)
    public void reloadBlogs() {
        List<Blog> blogs = blogRepository.findAll();
        for (Blog blog : blogs) {
            saveItems(blog);
        }
    }

    @PreAuthorize("#blog.user.name == authentication.name or hasRole('ROLE_ADMIN')")
    public void delete(@P("blog")Blog blog) {
        blogRepository.delete(blog);
    }

    public void delete(int id) {
        blogRepository.delete(id);
    }

    public Blog findOne(int id) {
        return blogRepository.findOne(id);
    }
}
