package in.dev.jba.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.dev.jba.repository.BlogRepository;
import in.dev.jba.repository.ItemRepository;
import in.dev.jba.repository.RoleRepository;
import in.dev.jba.repository.UserRepository;
import in.dev.jba.entity.Blog;
import in.dev.jba.entity.Item;
import in.dev.jba.entity.Role;
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
		
		@Autowired
		private RoleRepository roleRepository;
		
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
			user.setEnable(true);
			BCryptPasswordEncoder encode=new BCryptPasswordEncoder();
			user.setPassword(encode.encode(user.getPassword()));
					
			
			List<Role> roles=new ArrayList<Role>();
			roles.add(roleRepository.findByName("ROLE_USER"));
		
			user.setRoles(roles);
			userRepository.save(user);
			
		}

		public User findOneWithBlogs(String name) {
			User user=userRepository.findByName(name);
			return findOneWithBlogs(user.getId());
		}

		public void delete(int id) {
			userRepository.delete(id);
			
		}
}
