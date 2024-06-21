package controller;

import model.DAO.ProjetoDAO;
import model.Projeto;
import model.Usuario;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class ProjetoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");
        HttpSession session = request.getSession(false); // Obter a sessão sem criar uma nova

        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp"); // Redireciona para a página de login se não estiver logado
            return;
        }

        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (acao.equals("criar")) {
            String titulo = request.getParameter("titulo");
            String descricao = request.getParameter("descricao");
            String dataFinal = request.getParameter("dataFinal");
            String status = request.getParameter("status");

            Projeto projeto = new Projeto(titulo, descricao, dataFinal, status, usuario.getId()); // Obtém o ID do usuário da sessão

            ProjetoDAO projetoDAO = new ProjetoDAO();
            projetoDAO.adicionarProjeto(projeto);

            response.sendRedirect("projeto?acao=listar"); // Redireciona para a listagem de projetos
        } else if ("editar".equals(acao)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String titulo = request.getParameter("titulo");
                String descricao = request.getParameter("descricao");
                String dataFinal = request.getParameter("dataFinal");
                String status = request.getParameter("status");

                Projeto projeto = new Projeto(id, titulo, descricao, dataFinal, status, usuario.getId()); // Obtém o ID do usuário da sessão
                ProjetoDAO projetoDAO = new ProjetoDAO();
                projetoDAO.atualizarProjeto(projeto);

                response.sendRedirect("projeto?acao=listar"); // Redireciona para a listagem de projetos
            } catch (NumberFormatException e) {
                // Tratar o erro caso o parâmetro "id" seja inválido
                response.sendRedirect("listarProjetos.jsp"); // Redireciona de volta para a lista de projetos
                return; // Encerra o método para evitar erros subsequentes
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");
        HttpSession session = request.getSession(false); // Obter a sessão sem criar uma nova

        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp"); // Redireciona para a página de login se não estiver logado
            return;
        }

        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if ("editar".equals(acao)) {
            try {
                int projetoId = Integer.parseInt(request.getParameter("id"));
                ProjetoDAO projetoDAO = new ProjetoDAO();
                Projeto projeto = projetoDAO.buscarProjetoPorId(projetoId);

                if (projeto != null && projeto.getUsuarioId() == usuario.getId()) {
                    request.setAttribute("projeto", projeto); // Define o projeto a ser editado
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/editarProjeto.jsp");
                    dispatcher.forward(request, response);
                } else {
                    System.out.println("Erro: Projeto não encontrado ou usuário não autorizado.");
                    response.sendRedirect("/telaProjeto.jsp");
                }
            } catch (NumberFormatException e) {
                System.out.println("Erro: ID do projeto inválido.");
                response.sendRedirect("listarProjetos.jsp");
            }
        } else if ("listar".equals(acao)) {
            ProjetoDAO projetoDAO = new ProjetoDAO();
            ArrayList<Projeto> projetos = projetoDAO.listarProjetosDoUsuario(usuario.getId());
            request.setAttribute("projetos", projetos);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/listarProjetos.jsp");
            dispatcher.forward(request, response);
        } else if ("listarTodos".equals(acao)) {
            ProjetoDAO projetoDAO = new ProjetoDAO();
            ArrayList<Projeto> projetos = projetoDAO.listarTodosProjetos();
            request.setAttribute("projetos", projetos);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/listarTodosProjetos.jsp");
            dispatcher.forward(request, response);
        } else if ("excluir".equals(acao)) {
            int projetoId = Integer.parseInt(request.getParameter("id"));
            ProjetoDAO projetoDAO = new ProjetoDAO();
            projetoDAO.excluirProjeto(projetoId, usuario.getId()); // Passa o ID do usuário para verificar a permissão
            response.sendRedirect("projeto?acao=listar"); // Redireciona para a listagem de projetos após a exclusão
        }
    }
}
