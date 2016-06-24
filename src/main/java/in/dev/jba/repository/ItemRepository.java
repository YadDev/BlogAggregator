package in.dev.jba.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import in.dev.jba.entity.Blog;
import in.dev.jba.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {
		List<Item> findByBlog(Blog blog,Pageable pageable);
}
