package tw.grp4.member.model;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
@EnableTransactionManagement
public class MemberService  {
	

	
	@Autowired
	private MemberDao mDao;
	

	
	public List<Member> searchAll() {
		return mDao.searchAll();
	}

	
	public boolean insert(Member javaBean) {
		return mDao.insert(javaBean);
	}
	
	
	public boolean update(String account, Member javaBean) {
		return mDao.update(account,javaBean);
		
	}
	
	
	public boolean delete(String account) {
		return mDao.delete(account);
	}
	
	
	public Member searchById(String account) {
		return mDao.searchById(account);
	}

	
	public Long getDataCount() {
		return mDao.getDataCount();
	}
	
}
