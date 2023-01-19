package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Produk;
import com.example.demo.service.IProdukservice;

@RestController
@CrossOrigin(origins = "http://localhost:8080")
@RequestMapping("/api/produk")
public class ProdukController {
	
	@Autowired
	IProdukservice produkservice;
	
	@PostMapping("/insertProduk")
	public Produk insertProduk(@RequestBody Produk produk) {
		return produkservice.insertProduk(produk);
	}
	
	@GetMapping("/getAllProduk")
	public List<Produk> getAllProduk(){
		return produkservice.getAllProduk();
	}
	
	@PutMapping("/updateProduk/{id}")
	public Produk updateProduk(@PathVariable int id, @RequestBody Produk produk) {
		return produkservice.updateProduk(id, produk);
	}
	
	@DeleteMapping("/deleteProduk/{id}")
	public Produk deleteProduk(@PathVariable int id) {
		return produkservice.deleteProduk(id);
	}
	
	

}
