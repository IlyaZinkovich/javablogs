package by.epam.tutorial.repository;

import by.epam.tutorial.model.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by IlyaZinkovich on 21.02.2015.
 */
public interface UserRepository extends JpaRepository<User, Integer> {
    public User findByName(String name);
}
