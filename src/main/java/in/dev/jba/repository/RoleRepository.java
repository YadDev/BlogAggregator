package in.dev.jba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import in.dev.jba.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

	Role findByName(String string);

}
