package com.example.demo.repository.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Produk;
import com.example.demo.repository.IProduk;

@Repository
public class Produkrepo implements IProduk {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Produk insertProduk(Produk produk) {
		// TODO Auto-generated method stub
		String query = "INSERT INTO produk(nama, harga, qty) VALUES (?, ?, ?)";
		jdbcTemplate.update(query, new Object[] {produk.getNama(), produk.getHarga(), produk.getQty()});		
		return produk;
	}

	@Override
	public List<Produk> getAllProduk() {
		// TODO Auto-generated method stub
		String query = "SELECT * FROM produk";
		return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(Produk.class));
	}

	@Override
	public Produk updateProduk(int id, Produk produk) {
		// TODO Auto-generated method stub
		String query = "UPDATE produk SET nama = ?, harga = ?, qty = ? WHERE id = ?";
		jdbcTemplate.update(query, new Object[] {produk.getNama(), produk.getHarga(), produk.getQty(), id});
		
		return produk;
	}

	@Override
	public Produk deleteProduk(int id) {
		// TODO Auto-generated method stub
		String query = "SELECT * FROM produk WHERE id = ?";
		
		var result = jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(Produk.class), id);
		
		query = "DELETE FROM produk WHERE id = ?";
		jdbcTemplate.update(query, id);
		return result;
	}

}
