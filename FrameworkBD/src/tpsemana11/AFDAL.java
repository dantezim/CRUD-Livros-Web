/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tpsemana11;

import java.sql.*;
import java.lang.reflect.*;
/**
 *
 * @author asenj
 */
public class AFDAL {
    private static Connection con;

    public static void conecta(String _bd) {
        Erro.setErro(false);
        try {
            Statement s;
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/" + _bd;
            con = DriverManager.getConnection(url, "postgres", "rede30");
            
            if (con != null) {
                System.out.println("Conexão estabelecida com sucesso.");
                System.out.println(con);
            } else {
                System.out.println("Falha ao estabelecer a conexão.");
            }
        } catch (Exception e) {
            Erro.setErro(e.getMessage());
        }
    }

    public static void desconecta() {
        Erro.setErro(false);
        try {
            con.close();
        } catch (Exception e) {
            Erro.setErro(e.getMessage());
        }
    }

    public static void executeSQL(String _sql) {
        Erro.setErro(false);
        conecta("postgres");
        if (Erro.getErro())
            return;
        try {
            Statement st = con.createStatement();
            st.executeUpdate(_sql);
            st.close();
        } catch (Exception e) {
            Erro.setErro(e.getMessage());
            return;
        }
        desconecta();
    }
    
    public static void executeSelect(String _sql, Object obj) {
        ResultSet rs;
        Field[] f = obj.getClass().getDeclaredFields();
        Method mtd;

        try {
            PreparedStatement st = con.prepareStatement(_sql);
            rs = st.executeQuery();
            if (rs.next()) {

                for (int i = 0; i < f.length; ++i) {
                    String set = "set" + f[i].getName().substring(0, 1).toUpperCase() + f[i].getName().substring(1);
                    mtd = livro.class.getMethod(set, String.class);
                    mtd.invoke(obj, rs.getString(i + 1));
                }
                
            } else {
                Erro.setErro("Livro não localizado.");
            }
            st.close();
        } catch (Exception e) {
            Erro.setErro(e.getMessage());
        }
}
}

