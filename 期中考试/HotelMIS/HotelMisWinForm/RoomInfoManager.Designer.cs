namespace HotelMIS.HotelMisWinForm
{
    partial class RoomInfoManager
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.gbInsertRoom = new System.Windows.Forms.GroupBox();
            this.btnConfirmA1 = new System.Windows.Forms.Button();
            this.btnConfirmA2 = new System.Windows.Forms.Button();
            this.photoFileName = new System.Windows.Forms.PictureBox();
            this.rbUpdate = new System.Windows.Forms.RadioButton();
            this.rbNew = new System.Windows.Forms.RadioButton();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.rbNO = new System.Windows.Forms.RadioButton();
            this.rbOK = new System.Windows.Forms.RadioButton();
            this.cbRoomTypeD1 = new System.Windows.Forms.ComboBox();
            this.txtNumofTable = new System.Windows.Forms.TextBox();
            this.txtRoomID = new System.Windows.Forms.TextBox();
            this.txtRoomName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cbRoomTypeD2 = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtIDD = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dgRoomID = new System.Windows.Forms.DataGridView();
            this.btnConfirmA3 = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.gbInsertRoom.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.photoFileName)).BeginInit();
            this.groupBox3.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgRoomID)).BeginInit();
            this.SuspendLayout();
            // 
            // gbInsertRoom
            // 
            this.gbInsertRoom.Controls.Add(this.btnConfirmA1);
            this.gbInsertRoom.Controls.Add(this.btnConfirmA2);
            this.gbInsertRoom.Controls.Add(this.photoFileName);
            this.gbInsertRoom.Controls.Add(this.rbUpdate);
            this.gbInsertRoom.Controls.Add(this.rbNew);
            this.gbInsertRoom.Controls.Add(this.groupBox3);
            this.gbInsertRoom.Controls.Add(this.cbRoomTypeD1);
            this.gbInsertRoom.Controls.Add(this.txtNumofTable);
            this.gbInsertRoom.Controls.Add(this.txtRoomID);
            this.gbInsertRoom.Controls.Add(this.txtRoomName);
            this.gbInsertRoom.Controls.Add(this.label2);
            this.gbInsertRoom.Controls.Add(this.label5);
            this.gbInsertRoom.Controls.Add(this.label6);
            this.gbInsertRoom.Controls.Add(this.label7);
            this.gbInsertRoom.Controls.Add(this.label3);
            this.gbInsertRoom.Location = new System.Drawing.Point(16, 13);
            this.gbInsertRoom.Margin = new System.Windows.Forms.Padding(4);
            this.gbInsertRoom.Name = "gbInsertRoom";
            this.gbInsertRoom.Padding = new System.Windows.Forms.Padding(4);
            this.gbInsertRoom.Size = new System.Drawing.Size(852, 298);
            this.gbInsertRoom.TabIndex = 0;
            this.gbInsertRoom.TabStop = false;
            this.gbInsertRoom.Text = "添加新的标签";
            // 
            // btnConfirmA1
            // 
            this.btnConfirmA1.Location = new System.Drawing.Point(624, 250);
            this.btnConfirmA1.Margin = new System.Windows.Forms.Padding(4);
            this.btnConfirmA1.Name = "btnConfirmA1";
            this.btnConfirmA1.Size = new System.Drawing.Size(92, 31);
            this.btnConfirmA1.TabIndex = 5;
            this.btnConfirmA1.Text = "确定";
            this.btnConfirmA1.UseVisualStyleBackColor = true;
            this.btnConfirmA1.Click += new System.EventHandler(this.btnConfirmA1_Click);
            // 
            // btnConfirmA2
            // 
            this.btnConfirmA2.Location = new System.Drawing.Point(740, 250);
            this.btnConfirmA2.Margin = new System.Windows.Forms.Padding(4);
            this.btnConfirmA2.Name = "btnConfirmA2";
            this.btnConfirmA2.Size = new System.Drawing.Size(87, 31);
            this.btnConfirmA2.TabIndex = 5;
            this.btnConfirmA2.Text = "取消";
            this.btnConfirmA2.UseVisualStyleBackColor = true;
            this.btnConfirmA2.Click += new System.EventHandler(this.btnConfirmA2_Click);
            // 
            // photoFileName
            // 
            this.photoFileName.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.photoFileName.Location = new System.Drawing.Point(406, 25);
            this.photoFileName.Margin = new System.Windows.Forms.Padding(4);
            this.photoFileName.Name = "photoFileName";
            this.photoFileName.Size = new System.Drawing.Size(421, 195);
            this.photoFileName.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.photoFileName.TabIndex = 4;
            this.photoFileName.TabStop = false;
            this.photoFileName.Click += new System.EventHandler(this.photoFileName_Click);
            // 
            // rbUpdate
            // 
            this.rbUpdate.AutoSize = true;
            this.rbUpdate.Location = new System.Drawing.Point(489, 250);
            this.rbUpdate.Margin = new System.Windows.Forms.Padding(4);
            this.rbUpdate.Name = "rbUpdate";
            this.rbUpdate.Size = new System.Drawing.Size(58, 19);
            this.rbUpdate.TabIndex = 0;
            this.rbUpdate.TabStop = true;
            this.rbUpdate.Text = "编辑";
            this.rbUpdate.UseVisualStyleBackColor = true;
            // 
            // rbNew
            // 
            this.rbNew.AutoSize = true;
            this.rbNew.Location = new System.Drawing.Point(379, 250);
            this.rbNew.Margin = new System.Windows.Forms.Padding(4);
            this.rbNew.Name = "rbNew";
            this.rbNew.Size = new System.Drawing.Size(58, 19);
            this.rbNew.TabIndex = 0;
            this.rbNew.TabStop = true;
            this.rbNew.Text = "新增";
            this.rbNew.UseVisualStyleBackColor = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.rbNO);
            this.groupBox3.Controls.Add(this.rbOK);
            this.groupBox3.Location = new System.Drawing.Point(93, 210);
            this.groupBox3.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox3.Size = new System.Drawing.Size(240, 50);
            this.groupBox3.TabIndex = 3;
            this.groupBox3.TabStop = false;
            // 
            // rbNO
            // 
            this.rbNO.AutoSize = true;
            this.rbNO.Location = new System.Drawing.Point(141, 19);
            this.rbNO.Margin = new System.Windows.Forms.Padding(4);
            this.rbNO.Name = "rbNO";
            this.rbNO.Size = new System.Drawing.Size(58, 19);
            this.rbNO.TabIndex = 0;
            this.rbNO.TabStop = true;
            this.rbNO.Text = "装修";
            this.rbNO.UseVisualStyleBackColor = true;
            // 
            // rbOK
            // 
            this.rbOK.AutoSize = true;
            this.rbOK.Location = new System.Drawing.Point(24, 19);
            this.rbOK.Margin = new System.Windows.Forms.Padding(4);
            this.rbOK.Name = "rbOK";
            this.rbOK.Size = new System.Drawing.Size(58, 19);
            this.rbOK.TabIndex = 0;
            this.rbOK.TabStop = true;
            this.rbOK.Text = "可订";
            this.rbOK.UseVisualStyleBackColor = true;
            // 
            // cbRoomTypeD1
            // 
            this.cbRoomTypeD1.FormattingEnabled = true;
            this.cbRoomTypeD1.Items.AddRange(new object[] {
            "小",
            "中",
            "大",
            "豪华"});
            this.cbRoomTypeD1.Location = new System.Drawing.Point(93, 118);
            this.cbRoomTypeD1.Margin = new System.Windows.Forms.Padding(4);
            this.cbRoomTypeD1.Name = "cbRoomTypeD1";
            this.cbRoomTypeD1.Size = new System.Drawing.Size(260, 23);
            this.cbRoomTypeD1.TabIndex = 2;
            // 
            // txtNumofTable
            // 
            this.txtNumofTable.Location = new System.Drawing.Point(93, 162);
            this.txtNumofTable.Margin = new System.Windows.Forms.Padding(4);
            this.txtNumofTable.Name = "txtNumofTable";
            this.txtNumofTable.Size = new System.Drawing.Size(260, 25);
            this.txtNumofTable.TabIndex = 1;
            // 
            // txtRoomID
            // 
            this.txtRoomID.Location = new System.Drawing.Point(93, 25);
            this.txtRoomID.Margin = new System.Windows.Forms.Padding(4);
            this.txtRoomID.Name = "txtRoomID";
            this.txtRoomID.Size = new System.Drawing.Size(260, 25);
            this.txtRoomID.TabIndex = 1;
            // 
            // txtRoomName
            // 
            this.txtRoomName.Location = new System.Drawing.Point(93, 70);
            this.txtRoomName.Margin = new System.Windows.Forms.Padding(4);
            this.txtRoomName.Name = "txtRoomName";
            this.txtRoomName.Size = new System.Drawing.Size(260, 25);
            this.txtRoomName.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(15, 174);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(82, 15);
            this.label2.TabIndex = 0;
            this.label2.Text = "容纳桌数：";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(15, 228);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(61, 15);
            this.label5.TabIndex = 0;
            this.label5.Text = "状   态";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(15, 29);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(82, 15);
            this.label6.TabIndex = 0;
            this.label6.Text = "包厢编号：";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(15, 118);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(82, 15);
            this.label7.TabIndex = 0;
            this.label7.Text = "包厢类型：";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(15, 74);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(82, 15);
            this.label3.TabIndex = 0;
            this.label3.Text = "包厢名称：";
            // 
            // cbRoomTypeD2
            // 
            this.cbRoomTypeD2.FormattingEnabled = true;
            this.cbRoomTypeD2.Items.AddRange(new object[] {
            "小",
            "中",
            "大",
            "豪华"});
            this.cbRoomTypeD2.Location = new System.Drawing.Point(383, 26);
            this.cbRoomTypeD2.Margin = new System.Windows.Forms.Padding(4);
            this.cbRoomTypeD2.Name = "cbRoomTypeD2";
            this.cbRoomTypeD2.Size = new System.Drawing.Size(220, 23);
            this.cbRoomTypeD2.TabIndex = 2;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(307, 30);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(82, 15);
            this.label4.TabIndex = 0;
            this.label4.Text = "包厢类型：";
            // 
            // txtIDD
            // 
            this.txtIDD.Location = new System.Drawing.Point(95, 26);
            this.txtIDD.Margin = new System.Windows.Forms.Padding(4);
            this.txtIDD.Name = "txtIDD";
            this.txtIDD.Size = new System.Drawing.Size(203, 25);
            this.txtIDD.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 29);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(82, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "包厢编号：";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dgRoomID);
            this.groupBox2.Controls.Add(this.btnConfirmA3);
            this.groupBox2.Controls.Add(this.btnDelete);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Controls.Add(this.txtIDD);
            this.groupBox2.Controls.Add(this.cbRoomTypeD2);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Location = new System.Drawing.Point(15, 319);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox2.Size = new System.Drawing.Size(852, 363);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "包厢信息";
            // 
            // dgRoomID
            // 
            this.dgRoomID.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgRoomID.Location = new System.Drawing.Point(12, 76);
            this.dgRoomID.Margin = new System.Windows.Forms.Padding(4);
            this.dgRoomID.Name = "dgRoomID";
            this.dgRoomID.ReadOnly = true;
            this.dgRoomID.RowTemplate.Height = 23;
            this.dgRoomID.Size = new System.Drawing.Size(832, 278);
            this.dgRoomID.TabIndex = 6;
            this.dgRoomID.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgRoomID_CellClick);
            // 
            // btnConfirmA3
            // 
            this.btnConfirmA3.Location = new System.Drawing.Point(625, 25);
            this.btnConfirmA3.Margin = new System.Windows.Forms.Padding(4);
            this.btnConfirmA3.Name = "btnConfirmA3";
            this.btnConfirmA3.Size = new System.Drawing.Size(92, 31);
            this.btnConfirmA3.TabIndex = 5;
            this.btnConfirmA3.Text = "检索";
            this.btnConfirmA3.UseVisualStyleBackColor = true;
            this.btnConfirmA3.Click += new System.EventHandler(this.btnConfirmA3_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Enabled = false;
            this.btnDelete.Location = new System.Drawing.Point(741, 22);
            this.btnDelete.Margin = new System.Windows.Forms.Padding(4);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(87, 31);
            this.btnDelete.TabIndex = 5;
            this.btnDelete.Text = "删除";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // RoomInfoManager
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(883, 686);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.gbInsertRoom);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "RoomInfoManager";
            this.Text = " ";
            this.Load += new System.EventHandler(this.RoomInfoManager_Load);
            this.gbInsertRoom.ResumeLayout(false);
            this.gbInsertRoom.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.photoFileName)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgRoomID)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.GroupBox gbInsertRoom;
        private System.Windows.Forms.PictureBox photoFileName;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.RadioButton rbNO;
        private System.Windows.Forms.RadioButton rbOK;
        private System.Windows.Forms.ComboBox cbRoomTypeD2;
        private System.Windows.Forms.TextBox txtNumofTable;
        private System.Windows.Forms.TextBox txtRoomName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtIDD;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btnConfirmA1;
        private System.Windows.Forms.Button btnConfirmA2;
        private System.Windows.Forms.RadioButton rbUpdate;
        private System.Windows.Forms.RadioButton rbNew;
        private System.Windows.Forms.ComboBox cbRoomTypeD1;
        private System.Windows.Forms.TextBox txtRoomID;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DataGridView dgRoomID;
        private System.Windows.Forms.Button btnConfirmA3;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.ToolTip toolTip1;

    }
}