package br.com.casadocodigo.loja.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import br.com.casadocodigo.loja.models.Produto;

@Repository
@Transactional
public class ProdutoDAO {
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Produto produto){
		manager.persist(produto);
	}

	public List<Produto> listar() {
		return manager.createQuery("select p from Produto p", Produto.class).getResultList();
	}

	public Produto find(Integer id) {
		System.out.println("find() id recebido = " + id);
		TypedQuery<Produto> tp = manager.createQuery("select distinct(p) from Produto p "
				+ " join fetch p.precos preco where p.id = " + id, Produto.class);
		Produto p = tp.getSingleResult();
		return p;
	}
}
