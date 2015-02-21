package by.epam.tutorial.repository;

import by.epam.tutorial.model.entities.Item;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by IlyaZinkovich on 21.02.2015.
 */
public interface ItemRepository extends JpaRepository<Item, Integer> {
}
