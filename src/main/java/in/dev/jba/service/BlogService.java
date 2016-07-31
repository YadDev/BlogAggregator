package in.dev.jba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.dev.jba.entity.Blog;
import in.dev.jba.entity.User;
import in.dev.jba.repository.BlogRepository;
import in.dev.jba.repository.UserRepository;

@Service
public class BlogService {

	@Autowired 
	private BlogRepository blogRepository;
	
	@Autowired
	private UserRepository userRepositry;
	
	public void save(Blog blog, String name) {
		User user=userRepositry.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);
		
	}

	public void delete(int id) {
		blogRepository.delete(id);
		
	}

}
