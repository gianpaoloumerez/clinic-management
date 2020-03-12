package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;

@WebServlet(name = "add_item", urlPatterns = {"/add_item"})
public class add_item extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
        {
            HttpSession session = request.getSession();  
            Connection con = Connector.ConnectDb();
            
            Date currentdate = new Date();
            DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
            String cdate =DFormat.format(currentdate);
            DateFormat DTFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
            String cdate_time =DTFormat.format(currentdate);
            DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
            String ct = DFormatlog.format(currentdate);
            
            String item_name = request.getParameter("item_name");
            String quantity = request.getParameter("quantity");
            String username = session.getAttribute("uname").toString();
            String password = request.getParameter("password");
            String item_type = session.getAttribute("item_type").toString();
            String return_address = session.getAttribute("return_address").toString();
            String chk = "clear";
            
            if (session.getAttribute("acct_Type").equals("personnel"))
            {
                try 
                {
                    PreparedStatement prpCHKDOC = con.prepareStatement("select * from inventory");
                    ResultSet rsdoccheck = prpCHKDOC.executeQuery();
                    while (rsdoccheck.next())
                        {
                            if (item_name.equals(rsdoccheck.getString("item_name")))
                            {
                                chk = "error";
                            }
                        } 
                }
                catch (Exception e)
                {
                    session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                    response.sendRedirect(return_address);
                }
                
                if (chk.equals("clear"))
                {
                    try 
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        String stAdd = "insert into inventory (item_name, quantity, item_type, date_added, date_updated) values (?,?,?,?,?)";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);

                        rsConfirm = stConfirm.executeQuery("select * from receptionist where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                            prpAdd.setString(1,item_name);
                            prpAdd.setString(2,quantity);
                            prpAdd.setString(3,item_type);
                            prpAdd.setString(4,cdate);
                            prpAdd.setString(5,cdate_time);
                            prpAdd.execute();

                            String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+username+"','"+cdate+"','Add Item in Inventory','Added "+quantity+" of "+item_name+"','"+ct+"')";
                            PreparedStatement prpLog = con.prepareStatement(sqlLog);
                            prpLog.execute();

                            session.setAttribute("edit_message", "&#128712 Item Successfully Added");
                            response.sendRedirect(return_address);
                        }
                        else 
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect Password Please Try Again ");
                            response.sendRedirect(return_address);
                        }
                    }
                    catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect(return_address);
                    }
                }
                else if (chk.equals("error"))
                {
                    session.setAttribute("edit_message", "&#128712 Item Name Already Used ");
                    response.sendRedirect(return_address);
                }
            }
            
            else if (session.getAttribute("acct_Type").equals("admin"))
            {
                try 
                {
                    PreparedStatement prpCHKDOC = con.prepareStatement("select * from inventory");
                    ResultSet rsdoccheck = prpCHKDOC.executeQuery();
                    while (rsdoccheck.next())
                        {
                            if (item_name.equals(rsdoccheck.getString("item_name")))
                            {
                                chk = "error";
                            }
                        } 
                }
                catch (Exception e)
                {
                    session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                    response.sendRedirect(return_address);
                }
                
                if (chk.equals("clear"))
                {
                    try 
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        String stAdd = "insert into inventory (item_name, quantity, item_type, date_added, date_updated) values (?,?,?,?,?)";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);

                        rsConfirm = stConfirm.executeQuery("select * from admin where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                            prpAdd.setString(1,item_name);
                            prpAdd.setString(2,quantity);
                            prpAdd.setString(3,item_type);
                            prpAdd.setString(4,cdate);
                            prpAdd.setString(5,cdate_time);
                            prpAdd.execute();

                            String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+username+"','"+cdate+"','Add Item in Inventory','Added "+quantity+" of "+item_name+"','"+ct+"')";
                            PreparedStatement prpLog = con.prepareStatement(sqlLog);
                            prpLog.execute();

                            session.setAttribute("edit_message", "&#128712 Item Successfully Added");
                            response.sendRedirect(return_address);
                        }
                        else 
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect Password Please Try Again ");
                            response.sendRedirect(return_address);
                        }
                    }
                    catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect(return_address);
                    }
                }
                else if (chk.equals("error"))
                {
                    session.setAttribute("edit_message", "&#128712 Item Name Already Used ");
                    response.sendRedirect(return_address);
                }
            }
            
            
        }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
