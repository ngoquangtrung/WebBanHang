package PRJ321x_A4.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PRJ321x_A4.Entity.Account;
@Service
public interface IAccount {
	@Autowired
	public List<Account> getAcc();
	
	public boolean checkAccount(Account acc);
}
