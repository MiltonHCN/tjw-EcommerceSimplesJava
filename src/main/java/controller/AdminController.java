package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Produto;
import beans.Usuario;
import model.OperacaoDB;

public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	ArrayList<Produto> lista_produtos = new ArrayList<>();
	HttpSession session;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");

		if (page == null) {
			request.getRequestDispatcher("admin-login.jsp").forward(request, response);
		} else {
			doPost(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");

		if (page.equals("admin-login-form")) {
			String username = request.getParameter("username");
			String senha = request.getParameter("senha");

			if (username.equals("admin") && senha.equals("admin")) {

				OperacaoDB operacao = new OperacaoDB();

				try {
					lista_produtos = operacao.fetchProducts();
				} catch (Exception e) {
					e.printStackTrace();
				}

				session = request.getSession();
				session.setAttribute("lista_produtos", lista_produtos);

				request.getRequestDispatcher("index-admin.jsp").forward(request, response);

			} else {
				request.setAttribute("msg", "Credenciais incorretas!");
				request.setAttribute("username", username);
				request.getRequestDispatcher("admin-login.jsp").forward(request, response);
			}
		}

		if (page.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			request.getRequestDispatcher("admin-login.jsp").forward(request, response);
		}

		if (page.equals("delete")) {
			String id = request.getParameter("id");

			OperacaoDB operacao = new OperacaoDB();

			try {

				operacao.deleteProductById(id);

			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				lista_produtos = operacao.fetchProducts();
			} catch (Exception e) {
				e.printStackTrace();
			}

			session = request.getSession();
			session.setAttribute("lista_produtos", lista_produtos);

			request.getRequestDispatcher("index-admin.jsp").forward(request, response);

		}

		if (page.equals("index-admin")) {
			request.getRequestDispatcher("index-admin.jsp").forward(request, response);
		}

		if (page.equals("addproduct")) {
			request.getRequestDispatcher("addProduct.jsp").forward(request, response);
		}

		if (page.equals("edit")) {
			String id = request.getParameter("id");
			OperacaoDB operacao = new OperacaoDB();
			Produto p = null;
			try {
				p = operacao.fetchProductsById(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("p", p);
			request.getRequestDispatcher("editProduct.jsp").forward(request, response);
		}

		if (page.equals("edit_product")) {
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String valor = request.getParameter("valor");
			String imagem = request.getParameter("imagem");

			System.out.println(nome);

			Produto p = new Produto();

			p.setId(Integer.parseInt(id));
			p.setNome(nome);
			p.setValor(valor);
			p.setImage(imagem);

			if (imagem.substring(0, 4).equals("img/")) {
				p.setImage(imagem);
			} else {
				p.setImage("img/" + imagem);
			}

			OperacaoDB operacao = new OperacaoDB();

			try {

				operacao.updateProduct(p);

			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				lista_produtos = operacao.fetchProducts();
			} catch (Exception e) {
				e.printStackTrace();
			}

			session = request.getSession();
			session.setAttribute("lista_produtos", lista_produtos);

			request.getRequestDispatcher("index-admin.jsp").forward(request, response);

		}

		if (page.equals("add_product")) {
			String nome = request.getParameter("nome");
			String valor = request.getParameter("valor");
			String imagem = request.getParameter("imagem");

			Produto p = new Produto();

			p.setNome(nome);
			p.setValor(valor);
			if (imagem.substring(0, 4).equals("img/")) {
				p.setImage(imagem);
			} else {
				p.setImage("img/" + imagem);
			}

			OperacaoDB operacao = new OperacaoDB();

			try {

				operacao.addProduct(p);

			} catch (Exception e) {

				e.printStackTrace();
			}

			try {
				lista_produtos = operacao.fetchProducts();
			} catch (Exception e) {
				e.printStackTrace();
			}

			session = request.getSession();
			session.setAttribute("lista_produtos", lista_produtos);

			request.getRequestDispatcher("index-admin.jsp").forward(request, response);

		}
	}

}