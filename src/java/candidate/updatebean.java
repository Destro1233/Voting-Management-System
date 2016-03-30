package candidate;

import java.sql.*;
import db.DatabaseConnection;


public class updatebean
{
private String fname;
public Connection c;

public PreparedStatement ps,ps1;

private String address;
private String city;
private String state;
private String prom;
private String social;
private String region;
private String qual;
private String exp;
private String Uid;
public int i1,i;
//private can_year;
public void setQual(String qual)
	{
		this.qual=qual;
	}
public void setUid(String Uid)
	{
		this.Uid=Uid;
	}
public void setExp(String exp)
	{
		this.exp=exp;
	}
public void setFname(String fname)
	{
		this.fname=fname;
	}
public void setAddress(String address)
	{
		this.address=address;
	}
public void setCity(String city)
	{
		this.city=city;
	}
public void setState(String state)
	{
		this.state=state;
	}

public void setProm(String prom)
	{
		this.prom=prom;
	}
public void setSocial(String social)
	{
		this.social=social;
	}



public void setRegion(String region)
	{
		this.region=region;
	}
public String getRegion()
{
    return region;
}


public String getFname()
	{
		return fname;
	}

public String getQual()
	{
		return qual;
	}
public String getExp()
	{
		return exp;
	}
public String getAddress()
	{
		return address;
	}
public String getCity()
	{
		return city;
	}
public String getState()
	{
		return state;
	}


public String getProm()
	{
		return prom;
	}
public String getSocial()
	{
		return social;
	}


public void update(String userid) throws SQLException
{
 

    c=db.DatabaseConnection.dbConnect("XE");
    ps=c.prepareStatement("update cand_profile set cand_address=? ,cand_city=?,cand_state=? where cand_log_id=?");
    ps.setString(1, address);
    ps.setString(2, city);
    ps.setString(3, state);
    ps.setString(4,userid);
   i=ps.executeUpdate();
  System.out.println(address+city+state);
    System.out.println(prom+social+region+qual+exp);
    ps1=c.prepareStatement("update cand_record set cand_promises=?, cand_social_work=?, cand_region_of_comp=?,cand_qual=?, cand_exp=? where cand_log_id=?");
   ps1.setString(1,prom);
   ps1.setString(2,social);
  ps1.setString(3,region);
   ps1.setString(4,qual);
    ps1.setString(5,exp);
        ps1.setString(6,userid);
      i1=ps1.executeUpdate();
       

   if(i==1 && i1==1)
   {
     System.out.println("Update query successfull");

   }
   else if(i==0 || i1==0)
   {
           System.out.println("Update query failed");
   }

}
public void getdata()
{
 System.out.println(fname+address+city+state);
 System.out.println(prom+social+region+qual+exp);
}





}