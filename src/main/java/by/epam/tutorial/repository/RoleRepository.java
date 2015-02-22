package by.epam.tutorial.repository;

import by.epam.tutorial.model.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer> {
    public Role findByName(String role_user);
}
