package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import beans.Produto;
import beans.Usuario;
import model.OperacaoDB;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	ArrayList<Produto> listaProdutos = new ArrayList<>();
	static ArrayList<String> listaCarrinho = new ArrayList<>();
	ArrayList<Usuario> listaUsuarios = new ArrayList<>();
	HttpSession session;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");

		if (page == null || page.equals("index")) {

			OperacaoDB operacao = new OperacaoDB();

			try {
				listaProdutos = operacao.fetchProducts();
			} catch (Exception e) {
				e.printStackTrace();
			}

			session = request.getSession();

			session.setAttribute("listaCarrinho", listaCarrinho);
			session.setAttribute("listaProdutos", listaProdutos);

			request.getRequestDispatcher("index.jsp").forward(request, response);

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

		if (page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

		if (page.equals("sign-up")) {
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}

		if (page.equals("sign-up-form")) {
			String username = request.getParameter("username");
			String senha_1 = request.getParameter("senha_1");
			String confirmacao_senha_1 = request.getParameter("confirmacao_senha_1");

			if (senha_1.equals(confirmacao_senha_1)) {

				Usuario usuario = new Usuario();

				usuario.setUsername(username);
				usuario.setSenha(senha_1);

				OperacaoDB operacao = new OperacaoDB();

				try {

					operacao.addUser(usuario);

				} catch (Exception e) {
					e.printStackTrace();
				}

				request.setAttribute("username", username);
				request.setAttribute("msg", "Conta criada com sucesso!");
				request.getRequestDispatcher("login.jsp").forward(request, response);

			} else {
				request.setAttribute("msg", "As senhas não coincidem!");
				request.setAttribute("username", username);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}

		}

		if (page.equals("login-form")) {

			String username = request.getParameter("username");
			String senha = request.getParameter("senha");

			OperacaoDB operacao = new OperacaoDB();

			boolean status = false;

			try {
				status = operacao.checkUser(username, senha);
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (status) {
				session = request.getSession();
				session.setAttribute("session", session);

				try {
					listaUsuarios = operacao.fetchUser();
				} catch (Exception e) {
					e.printStackTrace();
				}

				session.setAttribute("username", username);
				request.getRequestDispatcher("index.jsp").forward(request, response);

			} else {
				request.setAttribute("msg", "Credenciais inválidas!");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

		}

		if (page.equals("logout")) {
			session = request.getSession();
			session.invalidate();

			session = request.getSession();
			listaCarrinho.clear();
			session.setAttribute("listaCarrinho", listaCarrinho);
			session.setAttribute("listaProdutos", listaProdutos);

			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

		if (page.equals("showcart")) {
			request.getRequestDispatcher("carrinho.jsp").forward(request, response);
		}

		if (page.equals("addtocart")) {
			String id = request.getParameter("id");

			Produto p = new Produto();

			boolean check = p.check(listaCarrinho, id);

			if (check)
				JOptionPane.showMessageDialog(null, "O produto já está no carrinho", "Info",
						JOptionPane.INFORMATION_MESSAGE);
			else {
				listaCarrinho.add(id);
				JOptionPane.showMessageDialog(null, "Produto adicionado ao carrinho com sucesso!", "Info",
						JOptionPane.INFORMATION_MESSAGE);
			}

			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

		if(page.equals("finalizarCompra_1")) {
			request.getRequestDispatcher("finalizarCompra.jsp").forward(request, response);	
		}
		
		if(page.equals("finalizarCompra_2")) {
			request.getRequestDispatcher("finalizarCompra.jsp").forward(request, response);
			session = request.getSession();
			listaCarrinho.clear();
			session.setAttribute("listaCarrinho", listaCarrinho);
		}
		
		if (page.equals("remove")) {
			String id = request.getParameter("id");
			Produto p = new Produto();

			listaCarrinho = p.remove(listaCarrinho, id);

			session = request.getSession();
			session.setAttribute("listaCarrinho", listaCarrinho);
			request.getRequestDispatcher("carrinho.jsp").forward(request, response);
		}
	}

}
