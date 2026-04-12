package com.model;
import java.sql.Date;

public class Patient {
    private int patientID;
    private String patientName;
    private int age;
    private String gender;
    private Date admissionDate;
    private String ailment;
    private String assignedDoctor;

    public int getPatientID() { 
    	return patientID; 
    	}
    public void setPatientID(int id) { 
    	this.patientID = id; 
    	}
    public String getPatientName() { 
    	return patientName; 
    	}
    public void setPatientName(String name) { 
    	this.patientName = name; 
    	}
    public int getAge() { 
    	return age; 
    }
    public void setAge(int age) { 
    	this.age = age; 
    	}
    public String getGender() { 
    	return gender; 
    }
    public void setGender(String g) { 
    	this.gender = g; 
    	}
    public Date getAdmissionDate() { 
    	return admissionDate; 
    	}
    public void setAdmissionDate(Date d) { 
    	this.admissionDate = d; 
    	}
    public String getAilment() { 
    	return ailment; 
    	}
    public void setAilment(String a) { 
    	this.ailment = a; 
    	}
    public String getAssignedDoctor() { 
    	return assignedDoctor; 
    	}
    public void setAssignedDoctor(String doc) { 
    	this.assignedDoctor = doc; 
    	}
}