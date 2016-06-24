package in.dev.jba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.dev.jba.entity.Blog;
import in.dev.jba.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer> {
		List<Blog> findByUser(User user);
}
