package registerbeans;
import java.sql.*;
import java.io.*;
import db.DatabaseConnection;
import java.util.UUID;

public class userregisterbean
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
//private Blob snap;
private String vid;
private String pswd;
private Connection c;
private PreparedStatement ps,ps1,ps2;

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

//DAtabase Insertion
public boolean insertValueInTables() throws IOException,SQLException
    {
    
     c=DatabaseConnection.dbConnect("XE");
     c.setAutoCommit(false);
    System.out.println("Connected");
    System.out.println("Statement Created");
   // System.out.println(id+fname+mname+lname+ffname+fmname+flname+address+pin+city+state+vid+status+gender+date+month+year);
    dob=date+"-"+month+"-"+year;
    UUID auid= UUID.randomUUID();
    String adminid[]=auid.toString().split("-");
  
    ps=c.prepareStatement("insert into USER_PROFILE values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
    ps.setString(1, id);
    ps.setString(2, vid.toUpperCase());
    ps.setString(3,adminid[2]);
    ps.setString(4, fname);
    ps.setString(5, mname);
    ps.setString(6, lname);
    ps.setString(7, ffname);
    ps.setString(8, fmname);
    ps.setString(9, flname);
    ps.setString(10,dob);
    ps.setString(11, address);
    ps.setString(12, "None");
    ps.setString(13, state);
    ps.setString(14, status);
    ps.setString(15,VotingYear.VotingDate.getYear());
    ps.setLong(16, pin);
    ps.setString(17, gender);
    ps.setString(18,"");
    ps.setInt(19, 0);

    //updating user admin table
    ps1=c.prepareStatement("INSERT INTO USER_VOTING VALUES(?,?,?)");
    ps1.setString(1,adminid[2]);
    //password
    ps1.setString(2,adminid[3]);
    ps1.setString(3,VotingYear.VotingDate.getYear());

    //user login
    ps2=c.prepareStatement("insert into user_login values(?,?,?)");
    ps2.setString(1,id);
    ps2.setString(2,adminid[1]);
    ps2.setString(3,VotingYear.VotingDate.getYear());


    //System.out.println(id+"-"+);
    int k=ps2.executeUpdate();

    int j=ps1.executeUpdate();
    int i=ps.executeUpdate();
    System.out.println("User Inserted");
    if(i>0 & j>0 & k>0) {
        c.commit(); ps.close();
    ps1.close();
    ps2.close();
    c.close(); return true;
    }
    else{
        c.rollback();
        ps.close();
    ps1.close();
    ps2.close();
    c.close();
        return false; }
    
    
    }


}

