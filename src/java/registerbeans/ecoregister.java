package registerbeans;
import java.sql.*;
import java.io.*;
import java.util.UUID;
import db.DatabaseConnection;

public class ecoregister
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
public PreparedStatement ps,ps1;
private String vid;
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
//DAtabase Insertion
public boolean insertValueInTables() throws IOException,SQLException
    {
    dob=date+"-"+month+"-"+year;
    UUID Id=UUID.randomUUID();
    String aid[]=Id.toString().split("-");
     c=DatabaseConnection.dbConnect("XE");
     c.setAutoCommit(false);
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
    ps.setString(15,VotingYear.VotingDate.getYear());
    ps.setLong(16,pin);
    ps.setString(17, gender);
    ps.setString(18,null);
    //seting password
    ps1=c.prepareStatement("insert into eco_login values(?,?,?)");
    ps1.setString(1,id);
    ps1.setString(2,aid[1]);
    ps1.setString(3,VotingYear.VotingDate.getYear());


    //System.out.println(id+"-"+);
    int j=ps1.executeUpdate();
    int i=ps.executeUpdate();
    
    
    System.out.println("inserted");
    if(i>0 &j>0){ c.commit(); return true;}
    else {c.rollback(); return false; }

    }
}