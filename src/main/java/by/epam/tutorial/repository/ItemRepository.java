package by.epam.tutorial.repository;

import by.epam.tutorial.model.entities.Blog;
import by.epam.tutorial.model.entities.Item;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Integer> {
    public List<Item> findByBlog(Blog blog, Pageable pageable);
    public Item findByBlogAndLink(Blog blog, String link);
}
