package model;

public class Projeto {
    private int id;
    private String titulo;
    private String descricao;
    private String dataFinal;
    private String status;
    private int usuarioId;

    public Projeto() {
    }

    public Projeto(String titulo, String descricao, String dataFinal, String status, int usuarioId) {
        this.titulo = titulo;
        this.descricao = descricao;
        this.dataFinal = dataFinal;
        this.status = status;
        this.usuarioId = usuarioId;
    }

    public Projeto(int id, String titulo, String descricao, String dataFinal, String status, int usuarioId) {
        this.id = id;
        this.titulo = titulo;
        this.descricao = descricao;
        this.dataFinal = dataFinal;
        this.status = status;
        this.usuarioId = usuarioId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(String dataFinal) {
        this.dataFinal = dataFinal;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }
}
