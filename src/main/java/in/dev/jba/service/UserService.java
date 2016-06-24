package in.dev.jba.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.dev.jba.repository.BlogRepository;
import in.dev.jba.repository.ItemRepository;
import in.dev.jba.repository.UserRepository;
import in.dev.jba.entity.Blog;
import in.dev.jba.entity.Item;
import in.dev.jba.entity.User;;

@Service
@Transactional
public class UserService {

		@Autowired
		private UserRepository userRepository;
		
		@Autowired
		private BlogRepository blogRepository;
		
		@Autowired 
		private ItemRepository itemRepository;
		
		public List<User> finaAll()
		{
			return userRepository.findAll();
		}

		public User findOne(int id) {

				
			return userRepository.findOne(id);
		}
		
		@Transactional
		public User findOneWithBlogs(int id) {
			User user=findOne(id);
			List<Blog> blogs= blogRepository.findByUser(user);
			for(Blog blog:blogs){
				List<Item> items=itemRepository.findByBlog(blog,new PageRequest(0, 10, Direction.DESC, "publishDate"));
				blog.setItems(items);
			}
			user.setBlogs(blogs);
			return user;
			
		}

		
		public void save(User user) {
			userRepository.save(user);
			
		}
}
