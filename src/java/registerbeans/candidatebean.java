package registerbeans;
import java.sql.*;
import java.io.*;
import java.util.UUID;
import db.DatabaseConnection;
import java.util.logging.Level;
import java.util.logging.Logger;


public class candidatebean
{
private String fname;
public Connection c;
private String mname;
public PreparedStatement ps;
public PreparedStatement ps1,ps2,ps3;
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
private String dob;

private String polname;
private boolean sucess;


//private can_year;
public void setSucess(boolean sucess)
	{
		this.sucess=sucess;
	}

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
public void setPolname(String polname)
	{
		this.polname=polname;
	}
public void setRegion(String region)
	{
		this.region=region;
	}
public String getPolname()
	{
		return polname;
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
public boolean getSucess()
	{
		return sucess;
	}

//DAtabase Insertion
public boolean insertValueInTables() 
    {
    dob=date+"-"+month+"-"+year;
    UUID Id=UUID.randomUUID();
    String aid[]=Id.toString().split("-");
    try{
     c=DatabaseConnection.dbConnect("XE");
     c.setAutoCommit(false);
    System.out.println("Connected");
    System.out.println("Statement Created");
   // System.out.println(id+fname+mname+lname+ffname+fmname+flname+address+pin+city+state+vid+status+gender+date+month+year);
//candidate profile
    ps=c.prepareStatement("insert into CAND_PROFILE values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
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
    ps.setString(14, VotingYear.VotingDate.getYear());
    ps.setLong(15,pin);
    ps.setString(16, gender);
    ps.setString(17, polname);
    ps.setString(18,null);
    ps.setInt(19,0);
    
    //System.out.println(id+"-"+)
//candidate record
   ps1=c.prepareStatement("insert into CAND_RECORD values(?,?,?,?,?,?,?,?)" );
    ps1.setString(1, id);
    ps1.setString(2,VotingYear.VotingDate.getYear());
    ps1.setString(3,prom);
    ps1.setString(4, social);
    ps1.setString(5, region);
    ps1.setString(6, qual);
    ps1.setString(7, exp);
    ps1.setString(8, crimerec);
    //candidate login info
    ps2=c.prepareStatement("insert into c_login values(?,?,?)");
    ps2.setString(1,id);
    ps2.setString(2,aid[1]);
    ps2.setString(3,VotingYear.VotingDate.getYear());
//candidate regional status info
    ps3=c.prepareStatement("insert into cand_regional_status values(?,?,?,?)");
    ps3.setString(1,id);
    ps3.setString(2,VotingYear.VotingDate.getYear());
    ps3.setString(3,"NIL");
    ps3.setInt(4,0);

    //System.out.println(id+"-"+);

    int i=ps.executeUpdate();
    int k=ps2.executeUpdate();
    int j=ps1.executeUpdate();
    int l=ps3.executeUpdate();
    
    System.out.println("inserted");
    if(i>0 && j>0 & k>0 & l>0){ c.commit(); setSucess(true);}
    else { c.rollback(); setSucess(false); }

    }
catch(SQLException e)
{
    e.printStackTrace();
}
catch(Exception e)
{
    e.printStackTrace();
}

finally
{
            try {
                ps.close();
                ps1.close();
                ps2.close();
                ps3.close();
                c.close();

            } catch (SQLException ex) {
                Logger.getLogger(candidatebean.class.getName()).log(Level.SEVERE, null, ex);
            }
}
return getSucess();
}
}