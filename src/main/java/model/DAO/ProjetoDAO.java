package model.DAO;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Projeto;
import factory.ConnectionFactory;

public class ProjetoDAO {
    public void adicionarProjeto(Projeto projeto) {
        String sql = "INSERT INTO projetos (titulo, descricao, data_final, status, usuario_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, projeto.getTitulo());
            stmt.setString(2, projeto.getDescricao());
            stmt.setString(3, projeto.getDataFinal());
            stmt.setString(4, projeto.getStatus());
            stmt.setInt(5, projeto.getUsuarioId());
            stmt.execute();
            System.out.println("Projeto adicionado com sucesso");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public Projeto buscarProjetoPorId(int id) {
        String sql = "SELECT * FROM projetos WHERE id = ?";
        Projeto projeto = new Projeto();

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    projeto.setId(rs.getInt("id"));
                    projeto.setTitulo(rs.getString("titulo"));
                    projeto.setDescricao(rs.getString("descricao"));
                    projeto.setDataFinal(rs.getString("data_final"));
                    projeto.setStatus(rs.getString("status"));
                    projeto.setUsuarioId(rs.getInt("usuario_id"));
                }
            }
            System.out.println("Projeto encontrado: " + projeto.getTitulo());
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return projeto;
    }

    public void atualizarProjeto(Projeto projeto) {
        String sql = "UPDATE projetos SET titulo = ?, descricao = ?, data_final = ?, status = ?, usuario_id = ? WHERE id = ?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, projeto.getTitulo());
            stmt.setString(2, projeto.getDescricao());
            stmt.setString(3, projeto.getDataFinal());
            stmt.setString(4, projeto.getStatus());
            stmt.setInt(5, projeto.getUsuarioId());
            stmt.setInt(6, projeto.getId());
            stmt.execute();
            System.out.println("Projeto atualizado com sucesso");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Projeto> listarProjetosDoUsuario(int usuarioId) {
        String sql = "SELECT * FROM projetos WHERE usuario_id = ?";
        ArrayList<Projeto> projetos = new ArrayList<>();

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, usuarioId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Projeto projeto = new Projeto();
                    projeto.setId(rs.getInt("id"));
                    projeto.setTitulo(rs.getString("titulo"));
                    projeto.setDescricao(rs.getString("descricao"));
                    projeto.setDataFinal(rs.getString("data_final"));
                    projeto.setStatus(rs.getString("status"));
                    projeto.setUsuarioId(rs.getInt("usuario_id"));
                    projetos.add(projeto);
                }
            }
            System.out.println("Projetos do usuário " + usuarioId + " encontrados.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return projetos;
    }

    public ArrayList<Projeto> listarTodosProjetos() {
        String sql = "SELECT * FROM projetos"; // Consulta para buscar todos os projetos
        ArrayList<Projeto> projetos = new ArrayList<>();

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Projeto projeto = new Projeto();
                projeto.setId(rs.getInt("id"));
                projeto.setTitulo(rs.getString("titulo"));
                projeto.setDescricao(rs.getString("descricao"));
                projeto.setDataFinal(rs.getString("data_final"));
                projeto.setStatus(rs.getString("status"));
                projeto.setUsuarioId(rs.getInt("usuario_id"));
                projetos.add(projeto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        return projetos;
    }

    public void excluirProjeto(int projetoId, int usuarioId) {
        String sql = "DELETE FROM projetos WHERE id = ? AND usuario_id = ?"; // Verifica se o projeto pertence ao usuário

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, projetoId);
            stmt.setInt(2, usuarioId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


}
