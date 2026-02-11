package br.com.sistemacomercial.dao;

import br.com.sistemacomercial.model.Produto;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProdutoDAO {

    private final List<Produto> listaProdutos = new ArrayList<>();
    private int nextId = 1;

    public synchronized Produto adicionarProduto(Produto produto) {
        produto.setId(nextId++);
        listaProdutos.add(produto);
        return produto;
    }

    public List<Produto> listarProdutos() {
        return new ArrayList<>(listaProdutos);
    }

    public Optional<Produto> buscarPorId(int id) {
        return listaProdutos.stream().filter(p -> p.getId() == id).findFirst();
    }

    public synchronized boolean atualizarProduto(Produto produtoAtualizado) {
        Optional<Produto> opt = buscarPorId(produtoAtualizado.getId());
        if (opt.isPresent()) {
            Produto p = opt.get();
            p.setNome(produtoAtualizado.getNome());
            p.setPreco(produtoAtualizado.getPreco());
            return true;
        }
        return false;
    }

    public synchronized boolean removerProduto(int id) {
        return listaProdutos.removeIf(p -> p.getId() == id);
    }

    public void limpar() {
        listaProdutos.clear();
        nextId = 1;
    }
}
