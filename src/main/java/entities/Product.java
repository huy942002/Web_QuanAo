package entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the products database table.
 * 
 */
@Entity
@Table(name="products")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="don_gia")
	private float donGia;
	
	@Column(name="img")
	private String img;

	@Column(name="kich_thuoc")
	private float kichThuoc;

	@Column(name="ma_sac")
	private String maSac;

	@Column(name="so_luong")
	private int soLuong;

	private String ten;

	//bi-directional many-to-one association to Category
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;

	public Product() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getDonGia() {
		return this.donGia;
	}

	public void setDonGia(float donGia) {
		this.donGia = donGia;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public float getKichThuoc() {
		return this.kichThuoc;
	}

	public void setKichThuoc(float kichThuoc) {
		this.kichThuoc = kichThuoc;
	}

	public String getMaSac() {
		return this.maSac;
	}

	public void setMaSac(String maSac) {
		this.maSac = maSac;
	}

	public int getSoLuong() {
		return this.soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public String getTen() {
		return this.ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}