package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Produk;
import com.example.demo.repository.IProduk;
import com.example.demo.service.IProdukservice;

@Service
public class Produkservice implements IProdukservice {
	
	@Autowired
	IProduk produkrepo;

	@Override
	public Produk insertProduk(Produk produk) {
		// TODO Auto-generated method stub
		
		return produkrepo.insertProduk(produk);
	}

	@Override
	public List<Produk> getAllProduk() {
		// TODO Auto-generated method stub
		return produkrepo.getAllProduk();
	}

	@Override
	public Produk updateProduk(int id, Produk produk) {
		// TODO Auto-generated method stub
		return produkrepo.updateProduk(id, produk);
	}

	@Override
	public Produk deleteProduk(int id) {
		// TODO Auto-generated method stub
		return produkrepo.deleteProduk(id);
	}

}
