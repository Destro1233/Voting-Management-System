/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package user;
import java.sql.*;


/**
 *
 * @author Saurabh
 */
public class ProfileData {

    private String id;
private String fname;
private String mname;
private String lname;
private String ffname;
private String fmname;
private String flname;
private String gender;
private String date;
private int month;
private int year;
private String address;
private String city;
private String state;
private String status;
private long pin;
//private Blob snap;
private String vid;
private String pswd;
private Connection c;
private ResultSet rs;
private PreparedStatement ps;
//private eco_year_date;
public void setFname(String fname)
	{
		this.fname=fname;
	}
public void setMname(String mname)
	{
		this.mname=mname;
	}
public void setLname(String lname)
	{
		this.lname=lname;
	}

public void setId(String id)
	{
		this.id=id;
	}
public void setGender(String gender)
	{
		this.gender=gender;
	}
public void setDate(String date)
	{
		this.date=date;
	}
public void setMonth(int month)
	{
		this.month=month;
	}
public void setYear(int year)
	{
		this.year=year;
	}
public void setFfname(String ffname)
	{
		this.ffname=ffname;
	}
public void setFmname(String fmname)
	{
		this.fmname=fmname;
	}
public void setFlname(String flname)
	{
		this.flname=flname;
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
//public void setSnap(Blob snap)
//	{
//		this.snap=snap;
//	}
public void setVid(String vid)
{
   this.vid=vid;
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
public String getMname()
	{
		return mname;
	}
public String getLname()
	{
		return lname;
	}
public String getGender()
	{
		return gender;
	}
public String getDate()
	{
		return date;
	}
public int getMonth()
	{
		return month;
	}
public int getYear()
	{
		return year;
	}
public String getVid()
{
   return vid;
}
public String getFfname()
	{
		return ffname;
	}
public String getFmname()
	{
		return fmname;
	}
public String getFlname()
	{
		return flname;
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
//public Blob getSnap()
//	{
//		return snap;
//	}

public void setdata(String userid) throws SQLException
{
    c=db.DatabaseConnection.dbConnect("XE");
    ps=c.prepareStatement("select * from USER_PROFILE where USER_lOG_ID=?");
    ps.setString(1, userid);
    rs=ps.executeQuery();
    
    System.out.println("query executed");
    if(rs.next())
    {
        //System.out.println("data fetched");
        //System.out.println(rs.getString("USER_FNAME"));
       setFname(rs.getString("USER_FNAME"));
	   setMname(rs.getString("USER_MNAME"));
       setLname(rs.getString("USER_LNAME"));
       setId(rs.getString("USER_LOG_ID"));
	   setGender(rs.getString("USER_GENDER"));
	  setDate(rs.getString("USER_DOB"));
	  // setMonth(rs.getInt(month));
	 //setYear(int year);
	   setFfname(rs.getString("USER_FFNAME"));
	   setFmname(rs.getString("USER_FMNAME"));
       setFlname(rs.getString("USER_FLNAME"));
       setAddress(rs.getString("USER_ADDRESS"));
	 setCity(rs.getString("USER_CITY"));
	 setState(rs.getString("USER_STATE"));
	// setPin(rs.getInt(pin));

//public void setSnap(Blob snap)
//	{
//		this.snap=snap;
//	}
 setVid(rs.getString("USER_UNQ_ID"));
 setStatus(rs.getString("USER_STATUS"));
        }

 

}
public void getdata()
{
 System.out.println(id+fname+mname+lname+ffname+fmname+flname+address+pin+city+state+vid+status+gender);
}


}
