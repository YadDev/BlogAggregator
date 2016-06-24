package in.dev.jba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import in.dev.jba.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
