package PRJ321x_A4.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperAccount implements RowMapper<Account>{

	public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
		Account acc=new Account();
		acc.setId(rs.getString(1));
		acc.setPass(rs.getString(2));
		return acc;
	}

}
