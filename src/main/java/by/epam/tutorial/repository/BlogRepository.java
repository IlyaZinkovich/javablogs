package by.epam.tutorial.repository;

import by.epam.tutorial.model.entities.Blog;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by IlyaZinkovich on 21.02.2015.
 */
public interface BlogRepository extends JpaRepository<Blog, Integer> {
}
