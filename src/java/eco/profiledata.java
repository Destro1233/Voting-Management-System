package eco;

import java.sql.*;
import java.io.*;
import java.util.UUID;
import db.DatabaseConnection;

public class profiledata
{
private String id;
private String fname;
private String mname;
private String lname;
private String ffname;
private String fmname;
private String flname;
private String gender;
private int date;
private int month;
private int year;
private String address;
private String city;
private String state;
private String status;
private long pin;
private String dob;
public Connection c;
public PreparedStatement ps;
private String vid;
public ResultSet rs;

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
public void setDate(int date)
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
public void setStatus(String status)
	{
		this.status=status;
	}
public void setVid(String vid)
	{
		this.vid=vid;
	}
public void setDob(String dob)
{
    this.dob=dob;
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
public int getDate()
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
public String getVid()
	{
		return vid;
	}
public String getDob()
	{
		return dob;
	}
//DAtabase Insertion
/*public boolean insertValueInTables() throws IOException,SQLException
    {
    dob=date+"-"+month+"-"+year;
    UUID Id=UUID.randomUUID();
    String aid[]=Id.toString().split("-");
     c=DatabaseConnection.dbConnect("XE");
    System.out.println("Connected");
    System.out.println("Statement Created");
   //System.out.println(id+fname+mname+lname+ffname+fmname+flname+address+pin+city+state+vid+status+gender+date+month+year);

    ps=c.prepareStatement("insert into ECO_PROFILE values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
    ps.setString(1, id);
    ps.setString(2, vid);
    ps.setString(3,aid[2]);
    ps.setString(4, fname);
    ps.setString(5, mname);
    ps.setString(6, lname);
    ps.setString(7, ffname);
    ps.setString(8, fmname);
    ps.setString(9, flname);
    ps.setString(10,dob);
    ps.setString(11, address);
    ps.setString(12, city);
    ps.setString(13, state);
    ps.setString(14, status);
    ps.setString(15,"2011");
    ps.setLong(16,pin);
    ps.setString(17, gender);
    ps.setString(18,null);

    //System.out.println(id+"-"+);
    int i=ps.executeUpdate();
    
    System.out.println("inserted");
    if(i>0){ c.commit(); return true;}
    else return false;

    }*/
public void setdata(String userid) throws SQLException
{
    c=db.DatabaseConnection.dbConnect("XE");
    ps=c.prepareStatement("select * from ECO_PROFILE where ECO_lOG_ID=?");
    ps.setString(1, userid);
    rs=ps.executeQuery();

    System.out.println("query executed");
    if(rs.next())
    { System.out.println("data fetched");
        System.out.println(rs.getString("E_FNAME"));
       setFname(rs.getString("E_FNAME"));
	   setMname(rs.getString("E_MNAME"));
       setLname(rs.getString("E_LNAME"));
       setId(rs.getString("ECO_LOG_ID"));
	   setGender(rs.getString("ECO_GENDER"));
       setDob(rs.getString("ECO_DOB"));
	  // setDate(rs.getInt(date));
	  // setMonth(rs.getInt(month));
	 //setYear(int year);
	   setFfname(rs.getString("E_FFNAME"));
	   setFmname(rs.getString("E_FMNAME"));
       setFlname(rs.getString("E_FLNAME"));
       setAddress(rs.getString("ECO_ADDRESS"));
	 setCity(rs.getString("ECO_CITY"));
	 setState(rs.getString("ECO_STATE"));
     setPin(rs.getLong("ECO_PINCODE"));
	// setPin(rs.getInt(pin));

//public void setSnap(Blob snap)
//	{
//		this.snap=snap;
//	}
 setVid(rs.getString("ECO_UNQ_ID"));
 setStatus(rs.getString("ECO_STATUS"));
        }



}
public void getdata()
{
 System.out.println(id+fname+mname+lname+ffname+fmname+flname+address+pin+city+state+vid+status+gender);
}

}