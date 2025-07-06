package dto;

import java.io.Serializable;

public class Member implements Serializable {

	
	private static final long serialVersionUID = -719765657958303019L;
	
	private String id;// 회원 id
	private String password; // 회원 비밀번호
	private String name; // 회원 이름
	private String gender; // 회원 성별
	private String birth; // 회원 생년월일
	private String mail; // 회원 이메일
	private String phone; // 회원 전화번호
	private String address; // 회원 주소
	private String regist_day; // 회원 가입일
	
	
	// 생성자
	public Member() {
		super();
	}


	public Member(String id, String password, String name) {
		this.id = id;
		this.password = password;
		this.name = name;
	}

	// 메서드
	// 게터
	public String getId() {
		return id;
	}


	public String getPassword() {
		return password;
	}


	public String getName() {
		return name;
	}


	public String getGender() {
		return gender;
	}


	public String getBirth() {
		return birth;
	}


	public String getMail() {
		return mail;
	}


	public String getPhone() {
		return phone;
	}


	public String getAddress() {
		return address;
	}


	public String getRegist_day() {
		return regist_day;
	}

	
	// 세터
	public void setId(String id) {
		this.id = id;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}


	@Override
	public String toString() {
		return "member [id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender + ", birth="
				+ birth + ", mail=" + mail + ", phone=" + phone + ", address=" + address + ", regist_day=" + regist_day
				+ "]";
	}
	
	
 
}
