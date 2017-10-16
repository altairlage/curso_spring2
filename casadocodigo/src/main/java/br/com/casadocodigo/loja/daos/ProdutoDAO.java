package br.com.casadocodigo.loja.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.orm.jpa.support.OpenEntityManagerInViewFilter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;

@Repository
@Transactional
public class ProdutoDAO {
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Produto produto){
		manager.persist(produto);
	}

	public List<Produto> listar() {
		// com o OpenEntityManagerInViewFilter() na configuração e a query abaixo, ele fará uma query para pegar o produto + 1 por preço..
		// no caso, cerca de 4 a 6 queries:
		return manager.createQuery("select p from Produto p", Produto.class).getResultList();
		
		//dessa maneira o hibernate faz apenas uma consulta para recuperar as entidades:
		// return manager.createQuery("select distinct(p) from Produto p join fetch p.precos", Produto.class).getResultList();
	}

	public Produto find(Integer id) {
		System.out.println("find() id recebido = " + id);
		TypedQuery<Produto> tp = manager.createQuery("select distinct(p) from Produto p "
				+ " join fetch p.precos preco where p.id = " + id, Produto.class);
		Produto p = tp.getSingleResult();
		return p;
	}
	
	public BigDecimal somaProdutoPorTipoPreco(TipoPreco tipoPreco){
		TypedQuery<BigDecimal> query = manager.createQuery("select sum(preco.valor) from Produto p"
				+ " join p.precos preco where preco.tipo = :tipoPreco", BigDecimal.class);
		query.setParameter("tipoPreco", tipoPreco);
		
		return query.getSingleResult();
	}
}
