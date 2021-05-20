using DALUtility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmpRegistration
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          statebind();
          bindData();
        }

        private void bindData()
        {
            try
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ToString());
                SqlCommand command = new SqlCommand("Get_Registration", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@action", "all"));
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(command.ExecuteReader());
                GDV.DataSource = dt;
                GDV.AutoGenerateColumns = true;
                GDV.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        protected void GDV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GDV.PageIndex = e.NewPageIndex;
            bindData();
        }

        public void statebind()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ToString());
            SqlCommand command = new SqlCommand("select_NewState", con);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(command.ExecuteReader());
            ddlState.DataSource = dt;
            ddlState.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string k = "";
            for (int i = 0; i < CheckBoxList2.Items.Count; i++)
            {
                if (CheckBoxList2.Items[i].Selected)
                {
                    k = k + CheckBoxList2.Items[i].Text;
                }
            }
            
            try
            {
             DateTime txtDob = Convert.ToDateTime(TextDob.Text.Split('-')[2] + "-" + TextDob.Text.Split('-')[1] + "-" + TextDob.Text.Split('-')[0]);
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ToString());
                SqlCommand command = new SqlCommand("sp_empRegistration", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@Employee_id", Request.QueryString["nt"]));
                command.Parameters.Add(new SqlParameter("@Employee_Name", txtname.Text));
                command.Parameters.Add(new SqlParameter("@Employee_DOB", txtDob.ToString("yyyy-MM-dd")));
                command.Parameters.Add(new SqlParameter("@Gender", RadioButtonList1.SelectedValue));
                command.Parameters.Add(new SqlParameter("@Address", txtArea.Value));
                command.Parameters.Add(new SqlParameter("@State", ddlState.SelectedItem.Value));
                command.Parameters.Add(new SqlParameter("@Hobbies", k));
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(command);
                DataSet ds = new DataSet();                
                sda.Fill(ds);
                con.Close();
                string CloseWindow = "alert('Unable to save Registration, Please try again later.')";
                if (ds != null & ds.Tables.Count > 0) 
                {
                    if (int.Parse(ds.Tables[0].Rows[0][0].ToString()) > 0)
                    {
                        //resetFields();
                        if (Request.QueryString["nt"] != null)
                        {
                            CloseWindow = "alert('Registration updated Successfully.');";
                        }
                        else
                        {
                            CloseWindow = "alert('Project Saved Successfully.')";
                        }
                    }
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", CloseWindow, true);
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.Message.ToString());
            }
        }
    }
}

