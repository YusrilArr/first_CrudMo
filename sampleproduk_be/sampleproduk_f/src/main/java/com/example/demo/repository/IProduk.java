package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.Produk;



public interface IProduk {
	public Produk insertProduk(Produk produk);
	public List<Produk> getAllProduk();
	public Produk updateProduk(int id, Produk produk);
	public Produk deleteProduk(int id);
	

}
