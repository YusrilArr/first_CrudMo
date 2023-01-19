package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Produk;

public interface IProdukservice {
	public Produk insertProduk(Produk produk);
	public List<Produk> getAllProduk();
	public Produk updateProduk(int id, Produk produk);
	public Produk deleteProduk(int id);

}
