package PRJ321x_A4.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import PRJ321x_A4.Entity.Account;
import PRJ321x_A4.Entity.MapperAccount;

@Repository
public class HomeDao {
	@Autowired
	public JdbcTemplate _jdpcTemplet;

	public List<Account> getAcc() {
		List<Account> list=new ArrayList<Account>();
		String sql="select * from Account";
		list=_jdpcTemplet.query(sql,new MapperAccount());
		
		
		return list;
	}
}
