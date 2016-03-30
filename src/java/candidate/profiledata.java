package candidate;

import java.sql.*;
import db.DatabaseConnection;


public class profiledata
{
private String fname;
public Connection c;
private String mname;
public PreparedStatement ps;
public PreparedStatement ps1;
private String vid;
private String lname;
private String id;
private String gender;
private int date;
private int month;
private int year;
private String ffname;
private String fmname;
private String flname;
private String address;
private String city;
private String state;
private String qual;
private String exp;
private String crimerec;
private String pname;
private String prom;
private String social;
private long pin;
private String region;
public String dob;
private ResultSet rs;
//private can_year;
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
public void setQual(String qual)
	{
		this.qual=qual;
	}
public void setExp(String exp)
	{
		this.exp=exp;
	}
public void setCrimerec(String crimerec)
	{
		this.crimerec=crimerec;
	}
public void setPname(String pname)
	{
		this.pname=pname;
	}
public void setProm(String prom)
	{
		this.prom=prom;
	}
public void setSocial(String social)
	{
		this.social=social;
	}
public void setPin(long pin)
	{
		this.pin=pin;
	}


public void setVid(String vid)
	{
		this.vid=vid;
	}
   
public void setDob(String dob)
	{
        this.dob=dob;

		
	}

public void setRegion(String region)
	{
		this.region=region;
	}
public String getRegion()
{
    return region;
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
public String getQual()
	{
		return qual;
	}
public String getExp()
	{
		return exp;
	}
public String getCrimerec()
	{
		return crimerec;
	}
public String getPname()
	{
		return pname;
	}
public String getProm()
	{
		return prom;
	}
public String getSocial()
	{
		return social;
	}
public long getPin()
	{
		return pin;
	}
public String getVid()
	{
		return vid;
	}
public String getDob()
	{
		return dob;
	}
/*//DAtabase Insertion
public boolean insertValueInTables() throws IOException,SQLException
    {
    dob=date+"-"+month+"-"+year;
    UUID Id=UUID.randomUUID();
    String aid[]=Id.toString().split("-");
     c=DatabaseConnection.dbConnect("XE");
    System.out.println("Connected");
    System.out.println("Statement Created");
   // System.out.println(id+fname+mname+lname+ffname+fmname+flname+address+pin+city+state+vid+status+gender+date+month+year);

    ps=c.prepareStatement("insert into CAND_PROFILE values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
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
    ps.setString(14, "2011");
    ps.setLong(15,pin);
    ps.setString(16, gender);
    ps.setString(17, polname);
    ps.setString(18,null);
    
    //System.out.println(id+"-"+)

   ps1=c.prepareStatement("insert into CAND_RECORD values(?,?,?,?,?,?,?,?)" );
    ps1.setString(1, id);
    ps1.setString(2, "2011");
    ps1.setString(3,prom);
    ps1.setString(4, social);
    ps1.setString(5, region);
    ps1.setString(6, qual);
    ps1.setString(7, exp);
    ps1.setString(8, crimerec);
    int i=ps.executeUpdate();
    int j=ps1.executeUpdate();
    
    System.out.println("inserted");
    if(i>0 && j>0){ c.commit(); return true;}
    else return false;

    }*/
public void setdata(String userid) throws SQLException
{
       
    c=db.DatabaseConnection.dbConnect("XE");
    ps=c.prepareStatement("select * from CAND_PROFILE where CAND_lOG_ID=?");
    ps.setString(1, userid);
    rs=ps.executeQuery();

    System.out.println("query executed");
    if(rs.next())
    { System.out.println("data fetched");
        System.out.println(rs.getString("CAND_FNAME"));
       setFname(rs.getString("CAND_FNAME"));
	   setMname(rs.getString("CAND_MNAME"));
       setLname(rs.getString("CAND_LNAME"));
       setId(rs.getString("CAND_LOG_ID"));
	   setGender(rs.getString("CAND_GENDER"));
	  // setDate(rs.getInt(date));
	  // setMonth(rs.getInt(month));
	 //setYear(int year);
	   setFfname(rs.getString("CAND_FFNAME"));
	   setFmname(rs.getString("CAND_FMNAME"));
       setFlname(rs.getString("CAND_FLNAME"));
       setAddress(rs.getString("CAND_ADDRESS"));
	 setCity(rs.getString("CAND_CITY"));
	 setState(rs.getString("CAND_STATE"));
     setPname(rs.getString("POL_NAME"));
     setDob(rs.getString("CAND_DOB"));
	// setPin(rs.getInt(pin));

//public void setSnap(Blob snap)
//	{
//		this.snap=snap;
//	}
 setVid(rs.getString("CAND_UNQ_ID"));
 
        }

 ps=c.prepareStatement("select * from CAND_RECORD where CAND_lOG_ID=?");
  ps.setString(1, userid);
    rs=ps.executeQuery();

    System.out.println("query executed");
    if(rs.next())
    { System.out.println("data fetched");
       
       setProm(rs.getString("CAND_PROMISES"));
	   setSocial(rs.getString("CAND_SOCIAL_WORK"));
       setRegion(rs.getString("CAND_REGION_OF_COMP"));
       setQual(rs.getString("CAND_QUAL"));
	   setExp(rs.getString("CAND_EXP"));
	  // setDate(rs.getInt(date));
	  // setMonth(rs.getInt(month));
	 //setYear(int year);
	   setCrimerec(rs.getString("CAND_CRIME_RECORD"));
    }

}
public void getdata()
{
 System.out.println(id+fname+mname+lname+ffname+fmname+flname+address+pin+city+state+vid+gender);
 System.out.println(prom+social+region+qual+exp+crimerec);
}





}