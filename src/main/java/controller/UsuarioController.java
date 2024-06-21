package controller;

import model.DAO.UsuarioDAO;
import jakarta.servlet.http.HttpSession;
import model.Usuario;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if (acao.equals("cadastro")) {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            Usuario usuario = new Usuario();
            usuario.setNome(nome);
            usuario.setEmail(email);
            usuario.setSenha(senha);

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            usuarioDAO.adicionarUsuario(usuario);

            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else if (acao.equals("login")) {
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = usuarioDAO.buscarUsuario(email, senha);

            if (usuario != null) {
                // Login bem-sucedido
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                response.sendRedirect("telaProjeto.jsp");
            } else {
                // Login mal-sucedido
                response.sendRedirect("login.jsp");
            }
        }
        else if (acao.equals("logout")) {
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
        }

        if (acao.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            Usuario usuario = new Usuario(id,nome,email,senha);
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            usuarioDAO.atualizarUsuario(usuario);

            Usuario usuarioAtualizado = usuarioDAO.buscarUsuarioPorId(usuario.getId());
            request.getSession().setAttribute("usuario", usuarioAtualizado);

            response.sendRedirect("telaProjeto.jsp");

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");
        if ("editar".equals(acao)) {
            int usuarioId = (int) request.getSession().getAttribute("usuario");
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = usuarioDAO.buscarUsuarioPorId(usuarioId);
            request.setAttribute("usuario", usuario);
            RequestDispatcher dispatcher = request.getRequestDispatcher("editarLogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}
