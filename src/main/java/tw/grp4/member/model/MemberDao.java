package tw.grp4.member.model;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;




@Repository
@Transactional
@EnableTransactionManagement
public class MemberDao  {
	
	@Autowired 
	private SessionFactory sessionFactory;
	
	//為了顯示目前共有多少會員
	public Long getDataCount() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("select count(*) from Member", Long.class).getSingleResult();
	}
	
	
	public List<Member> searchAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<Member> query = session.createQuery("from Member",Member.class);
		
		return query.list();
		
	}
	
	public boolean insert(Member javaBean) {
		Session session = sessionFactory.getCurrentSession();
		//透過調用方法時傳進來的bean的pk值,取得資料庫中的那列資料
		Member  resultBean = session.get(Member.class,javaBean.getAccount());
		//如果資料庫沒有該列資料,則把傳進來的bean存到資料庫(不像JDBC得一個欄位一個欄位慢慢傳,傳物件給他hibernate就會把剩下的事做完)
		if(resultBean==null) {
			session.save(javaBean);
			return true;
		}
		//有該列資料的話,甚麼都不做,只回傳false
		return false;
	}

	
	public Member searchById(String account) {
		Session session = sessionFactory.getCurrentSession();
		Member member =  session.get(Member.class,account);
		return member;
		
	}
	
	public boolean update(String account, Member javaBean) {
		
		Session session = sessionFactory.getCurrentSession();
		Member resultBean = session.get(Member.class, account);

		if (resultBean != null) {
			resultBean.setHashed_pwd(javaBean.getHashed_pwd());
			resultBean.setSalt(javaBean.getSalt());
			resultBean.setBirthday(javaBean.getBirthday());
			resultBean.setLastname(javaBean.getLastname());
			resultBean.setFirstname(javaBean.getFirstname());
			resultBean.setEmail(javaBean.getEmail());
			resultBean.setM_address(javaBean.getM_address());
			resultBean.setPhone(javaBean.getPhone());
			resultBean.setM_address(javaBean.getM_address());
			resultBean.setMempic(javaBean.getMempic());

			return true;

		} else {
			return false;
		}

	}

	public boolean delete(String account) {
	Session session = sessionFactory.getCurrentSession();
	Member resultBean = session.get(Member.class,account);
	if(resultBean!=null) {
		session.delete(resultBean);
		return true;
	}
	return false;
}
	
	
	
	
	

}
