package beans;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Produto implements Comparable<Produto> {

	private int id;
	private String nome;
	private String valor;
	private String imagem;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getImagem() {
		return imagem;
	}
	public void setImage(String imagem) {
		this.imagem = imagem;
	}
	
	@Override
	public String toString() {
		return "Produto [id=" + id + ", nome=" + nome + ", valor=" + valor + ", imagem=" + imagem + "]";
	}
	public boolean check(ArrayList<String> listaCarrinho, String id2) {
		for(String id : listaCarrinho) {
			if(id.equals(id2))
				return true;
		}
		return false;
	}
	public ArrayList<String> remove(ArrayList<String> listaCarrinho, String id) {
		for(String cid : listaCarrinho) {
			if(cid.equals(id)) {
				listaCarrinho.remove(cid);
				break;
			}
				
		}
		
		return listaCarrinho;
	}
	public ArrayList<Produto> lowtohigh(ArrayList<Produto> list) {
		Collections.sort(list);
		return list;
	}
	@Override
	public int compareTo(Produto p) {
		
		return Integer.parseInt(this.valor) - Integer.parseInt(p.valor);
	}
	public ArrayList<Produto> hightolow(ArrayList<Produto> list) {
		Collections.sort(list, new Temp());
		return list;
	}
	
}


class Temp implements Comparator<Produto>{

	@Override
	public int compare(Produto o1, Produto o2) {
		return Integer.parseInt(o2.getValor()) - Integer.parseInt(o1.getValor());
	}
	
}