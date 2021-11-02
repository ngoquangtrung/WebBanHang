package PRJ321x_A4.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import PRJ321x_A4.Entity.*;

@Repository
public class AccountDao {
	@Autowired
	JdbcTemplate _jdbcTemplet;
	
	public List<Account> getAcc(){
		List<Account> listacc=new ArrayList<Account>();
		String sql="select* from Account";
		listacc=_jdbcTemplet.query(sql, new MapperAccount());
		return listacc;
	}
	public Account getUser(Account acc) {
		//Account result=new Account();
		List<Account> result=new ArrayList<Account>();
		String sql="select*from Account where user_mail= '"+acc.getId()+"'";
		result=_jdbcTemplet.query(sql, new MapperAccount());
		//result=_jdbcTemplet.queryForObject(sql, new MapperAccount());
		if(result.size()>0) {
			return result.get(0);
		}else {
			return null;
		}
		
	}
		
}
