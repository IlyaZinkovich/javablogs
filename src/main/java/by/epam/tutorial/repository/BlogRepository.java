package by.epam.tutorial.repository;

import by.epam.tutorial.model.entities.Blog;
import by.epam.tutorial.model.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BlogRepository extends JpaRepository<Blog, Integer> {
    public List<Blog> findByUser(User user);
}
