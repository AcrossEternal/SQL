using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using HotelMIS.Comm;
using HotelMIS.DataAccess;
using HotelMIS.HotelBussinessLogic;
using System.IO;

namespace HotelMIS.HotelMisWinForm
{
    public partial class RoomInfoManager : Form
    {
        private RoomBussinessLogic logic;
        private string RoomPhoto ;
        private string fname = "";
        private string RoomID;

        private int currentRowIndx;//存放下标

        private string deleteRoom;//删除图书
        public RoomInfoManager()
        {
            InitializeComponent();
            logic = new RoomBussinessLogic();
        }

        private void btnConfirmA1_Click(object sender, EventArgs e)
        {

            foreach (Control con in gbInsertRoom.Controls)
            {
                if (con is TextBox && con.Text == "")
                {
                    MessageBox.Show("请输入所有参数");
                    ((TextBox)con).Focus();
                    return;
                }
            }

            RoomID = txtRoomID.Text.Trim();
            if (RoomID == "")
            {
                MessageBox.Show("请输入房间号！");
                txtRoomID.Focus();
                return;
            }
            string RoomName = txtRoomName.Text.Trim();
            int RoomStatus;
            if (rbOK.Checked == true)
            {
                RoomStatus = 1;
            }
            else
            {
                RoomStatus = 0;
            }

            string RoomType = cbRoomTypeD1.Text.Trim();
            int NumofTable;
            try
            {
                NumofTable = Convert.ToInt16(txtNumofTable.Text.Trim());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                txtNumofTable.Focus();
                return;
            }
            if (rbNew.Checked)//当为按键新增的时候
            {

                try
                {
                    if (fname == "" || Path.GetFileName(fname) == "no.gif")//无照片
                    {
                        if (logic.IsRoom(RoomID, RoomName, NumofTable, RoomType, RoomStatus))
                        {
                            MessageBox.Show("插入包厢成功");
                            Resulte();
                        }
                        else
                        {
                            MessageBox.Show("插入失败！");
                            return;
                        }
                    }
                    else //插入有照片的包厢
                    {
                        if (logic.IsRoomPhoto(RoomID, RoomName, NumofTable, RoomType, RoomStatus, RoomPhoto))
                        {
                            MessageBox.Show("插入新包厢成功！");
                            Resulte();

                        }
                        else
                        {
                            MessageBox.Show("插入失败！");
                            return;
                        }
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else//当按键为编辑的时候
            {
                try
                {
                    if (fname == "" || Path.GetFileName(fname) == "no.gif")//编辑无照片的
                    {
                        if (logic.UpdateRoom(RoomID, RoomName, NumofTable, RoomType, RoomStatus))
                        {
                            MessageBox.Show("修改成功！");
                            Resulte();
                        }
                        else
                        {
                            MessageBox.Show("修改失败！");
                            return;
                        }
                    }
                    else//编辑有照片的
                    {
                        if (logic.UpdateRoomPhoto(RoomID, RoomName, NumofTable, RoomType, RoomStatus, RoomPhoto))
                        {
                            MessageBox.Show("修改成功！");
                            Resulte();
                        }
                        else
                        {
                            MessageBox.Show("修改失败！");
                            return;
                        }
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }





        private void btnConfirmA3_Click(object sender, EventArgs e)
        {
            string RoomID = txtIDD.Text.Trim();
            string RoomType = cbRoomTypeD2.Text.Trim();
            DataSet ds = logic.SelectRoomIDAndRoomType(RoomID, RoomType);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count == 0)
            {
                MessageBox.Show("没有您查找的房间");
                return;
            }
            dgRoomID.DataSource = dt;

        }

        private void dgRoomID_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                dgRoomID.CurrentRow.Selected = true;//选中行泛滥
                DataTable dt = (DataTable)dgRoomID.DataSource;
                currentRowIndx = dgRoomID.CurrentRow.Index;
                DataRow dr = dt.Rows[currentRowIndx];

                txtRoomID.Text = dr["RoomID"].ToString();
                txtRoomName.Text = dr["RoomName"].ToString();
                txtNumofTable.Text = Convert.ToString(dr["NumofTable"]);
                cbRoomTypeD1.Text = dr["RoomType"].ToString();

                object RoomStatus = dr["RoomStatus"];
                if (Convert.ToInt16(RoomStatus) == 1)
                {
                    rbOK.Select();
                }
                else
                {
                    rbNO.Select();
                }


                btnDelete.Enabled = true;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


            RoomID = txtRoomID.Text.Trim();
            object obj = logic.GetPhoto(RoomID);
            if (obj == null || obj == Convert.DBNull)
            {
                photoFileName.Image = Image.FromFile("no.gif");//如果没有照片，显示“暂无”
            }
            else
            {
                MemoryStream stream = new MemoryStream(obj as byte[]);
                photoFileName.Image = Image.FromStream(stream);
            }


        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (rbNew.Checked == true)
            {
                DialogResult result = MessageBox.Show("你确定要删除这房间么？", "确认删除", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);
                if (result == DialogResult.Yes)
                {
                    try
                    {
                        deleteRoom = txtRoomID.Text.Trim();
                        if (logic.DeleteRoom(deleteRoom))
                        {
                            MessageBox.Show("删除图书成功");
                            //刷新
                            Resulte();

                        }
                        else
                        {
                            MessageBox.Show("删除图书失败");
                            return;
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
                else if (rbUpdate.Checked == true)
                {

                }
            }
        }
        private void Resulte()
        {
            string RoomID = txtRoomID.Text.Trim();
            string RoomType = Convert.ToString(cbRoomTypeD2.SelectedValue);
            DataSet ds = logic.SelectRoomIDAndRoomType(RoomID, RoomType);
            DataTable dt = ds.Tables[0];
            dgRoomID.DataSource = dt;
        }

        private void photoFileName_Click(object sender, EventArgs e)
        {
            openFileDialog1.InitialDirectory = "E:\\SQL作业";//指定位置
            openFileDialog1.Filter = "jpg文件|*.jpg|gif文件|*.gif|bmp文件|*.bmp";//筛选器

            openFileDialog1.FilterIndex = 1;//显示文件的选项
            openFileDialog1.FileName = "";

            DialogResult result = openFileDialog1.ShowDialog();//打开图片

            if (result == DialogResult.OK)
            {
                //选择文件 
                RoomPhoto = openFileDialog1.FileName;
                if (RoomPhoto != "")
                {
                    photoFileName.Image = Image.FromFile(RoomPhoto);
                }
            }
        }

        private void btnConfirmA2_Click(object sender, EventArgs e)
        {
            NewMethod();
        }
        private void NewMethod()
        {
            txtIDD.Clear();
            txtNumofTable.Clear();
            txtRoomID.Clear();
            txtRoomName.Clear();
            rbNew.Checked = false;
            rbOK.Checked = false;
            rbNO.Checked = false;
            rbUpdate.Checked = false;
        }

        private void RoomInfoManager_Load(object sender, EventArgs e)
        {
            rbNew.Select();
        }




    }


}

