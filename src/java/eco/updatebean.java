package eco;

import java.sql.*;
import java.io.*;
import java.util.UUID;
import db.DatabaseConnection;

public class updatebean
{
private String id;
private String fname;
private String address;
private String city;
private String state;
private String status;
private long pin;
public Connection c;
public PreparedStatement ps;
public int i;

//private eco_year_date;
public void setFname(String fname)
	{
		this.fname=fname;
	}


public void setId(String id)
	{
		this.id=id;
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

public void setPin(long pin)
	{
		this.pin=pin;
	}
public void setStatus(String status)
	{
		this.status=status;
	}


public String getId()
	{
		return id;
	}
public String getFname()
	{
		return fname;
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

public long getPin()
	{
		return pin;
	}
public String getStatus()
	{
		return status;
	}



public void update(String userid) throws SQLException
{


    c=db.DatabaseConnection.dbConnect("XE");
    ps=c.prepareStatement("update eco_profile set eco_address=? ,eco_city=?,eco_state=?,eco_pincode=?,eco_status=? where eco_log_id=?");
    ps.setString(1, address);
    ps.setString(2, city);
    ps.setString(3, state);
    ps.setLong(4, pin);
    ps.setString(5,status);
    ps.setString(6,userid);
   i=ps.executeUpdate();
  System.out.println(address+city+state+pin+status);
    
   if(i==1)
   {
     System.out.println("Update query successfull");

   }
   else 
   {
           System.out.println("Update query failed");
   }

}
}