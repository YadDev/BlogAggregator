package in.dev.jba.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.dev.jba.entity.Blog;
import in.dev.jba.entity.Item;
import in.dev.jba.entity.Role;
import in.dev.jba.entity.User;
import in.dev.jba.repository.BlogRepository;
import in.dev.jba.repository.ItemRepository;
import in.dev.jba.repository.RoleRepository;
import in.dev.jba.repository.UserRepository;

@Transactional
@Service
public class InitDbService {

	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired 
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	@PostConstruct
	public void init(){
		
		Role roleUser=new Role();
		roleUser.setName("ROLE_USER");
		roleRepository.save(roleUser);
		
		

		Role roleAdmin=new Role();
		roleAdmin.setName("ROLE_ADMIN");
		roleRepository.save(roleAdmin);
		
		User userAdmin=new User();
		userAdmin.setName("admin");
		//userAdmin.setPassword("admin");
//    Password encyption
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		userAdmin.setPassword(encoder.encode("admin"));
		System.out.println("Encrypted Password is: "+encoder.encode("admin"));
		List<Role> roles=new ArrayList<Role>();
		roles.add(roleUser);
		roles.add(roleAdmin);
		userAdmin.setRoles(roles);
		userRepository.save(userAdmin);

		Blog blogStack=new Blog();
		blogStack.setName("Stack Overflow");
		blogStack.setUrl("http://stackoverflow.com/questions/36034131/java-abstract-class-code-review");
		blogStack.setUser(userAdmin);
		blogRepository.save(blogStack);
		
		Item item1=new Item();
		item1.setBlog(blogStack);
		item1.setTitle("Java Blog");
		item1.setLink("http://stackoverflow.com");
		item1.setPublishDate(new Date());
		itemRepository.save(item1);
		
		Item item2=new Item();
		item2.setBlog(blogStack);
		item2.setTitle("Spring JPA");
		item2.setLink("http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#orm-jpa");
		item2.setPublishDate(new Date());
		itemRepository.save(item2);
	}
	
}
