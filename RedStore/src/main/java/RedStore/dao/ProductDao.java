package RedStore.dao;

import java.io.PrintWriter;
import java.sql.*;

import RedStore.model.*;
import java.util.*;

import org.apache.catalina.connector.Response;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductDao(Connection con) {
		this.con=con;
	}
	
	
	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try{
			query = "select * from products";
			pst= con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row= new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setDescription(rs.getString("description"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	
	
	public List<Product> getEightProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try{
			query = "select * from products order by id desc limit 8";
			pst= con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row= new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setDescription(rs.getString("description"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	
	public List<Product> getFourProducts(){
		List<Product> products1 = new ArrayList<Product>();
		
		try{
			query = "select * from products order by id asc limit 4";
			pst= con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row= new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setDescription(rs.getString("description"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				products1.add(row);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return products1;
	}
	
	
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<Cart>();
		
		try {
			if(cartList.size()>0) {
				for(Cart item:cartList) {
					query="select * from products where id=?";
					pst=this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs=pst.executeQuery();
					
					while(rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setImage(rs.getString("image"));
						row.setDescription(rs.getString("description"));
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		}catch(Exception e) {
		System.out.println(e.getMessage());	
		}
		
		return products;
	}
	
	public Product getSingleProduct(int id) {
		
		Product row = null;
		
		try {
			query = "select * from products where id=?";
			pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs= pst.executeQuery();
			
			while(rs.next()) {
				row= new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setDescription(rs.getString("description"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
			}
			
		}catch(Exception e) {
			
		}
		
		return row;
	}
	
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum=0;
		
		try {
			if(cartList.size()>0) {
				for(Cart item:cartList) {
					query="select price from products where id=?";
					pst=this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs=pst.executeQuery();
					
					while(rs.next()) {
						sum+=rs.getDouble("price")*item.getQuantity();
					}
				}
			}
			
		}catch(Exception e) {
			
		}
		
		return sum;
	}
	
}
