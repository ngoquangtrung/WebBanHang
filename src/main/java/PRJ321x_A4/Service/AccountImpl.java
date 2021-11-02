package PRJ321x_A4.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PRJ321x_A4.Dao.AccountDao;
import PRJ321x_A4.Entity.Account;
@Service
public class AccountImpl implements IAccount{
	@Autowired
	private AccountDao accDao;
	public List<Account> getAcc() {
		
		return accDao.getAcc();
	}
	public boolean checkAccount(Account acc) {
		String pass=acc.getPass();
		acc=accDao.getUser(acc);
		
		if(acc!=null) {
			if(acc.getPass().equals(pass)) {
				return true;
			}else
				return false;			
		}else {
			return false;
		}
		
	}	
}
