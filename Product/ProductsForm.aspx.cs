using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Product
{
    public partial class ProductsForm : System.Web.UI.Page
    {
        private SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\abhij\Downloads\Compressed\drive-download-20170511T122350Z-001\Q1\Products.mdf;Integrated Security=True;Connect Timeout=30");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from tblProducts", conn);
                DataSet ds = new DataSet();
                da.Fill(ds);

                conn.Close();
            }
        }

        protected void btn_Submit(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (SqlCommand cmd = new SqlCommand("insert into tblProducts values ('" + TextBox1.Text + "','" + DropDownList1.Text + "','" + Convert.ToInt32(TextBox3.Text) + "','" + Convert.ToInt32(TextBox4.Text) + "','" + TextBox5.Text + "')", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    GridView1.DataBind();
                }

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "test", "<script>alert('Successfully Inserted.....!');</script>");
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "test", "<script>alert('Validation failed!');</script>");
            }
        }

        protected void btn_Reset(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            DropDownList1.SelectedIndex = 0;
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
        }
    }
}